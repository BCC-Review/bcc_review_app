import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/data/repositories/question/question_repository.dart';
import 'package:bcc_review_app/data/repositories/settings/settings_repository.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:result_dart/result_dart.dart';

class ExplanationViewModel extends ChangeNotifier {
  final QuestionRepository _questionRepository;
  final SettingsRepository _settingsRepository;
  // A instância do GenerativeModel será criada após obter a chave API
  GenerativeModel? _generativeModel;
  String _selectedModel =
      'gemini-2.0-flash-thinking-exp-01-21'; // Modelo padrão

  // Lista de modelos disponíveis
  final List<String> availableModels = [
    'gemini-2.0-flash',
    'gemini-2.0-flash-lite-001',
    'gemini-2.0-flash-thinking-exp-01-21',
    'gemini-2.5-pro-preview-03-25',
  ];

  String get selectedModel => _selectedModel;

  ExplanationViewModel(this._questionRepository, this._settingsRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  MultipleChoice? _question;
  MultipleChoice? get question => _question;

  String? _explanation;
  String? get explanation => _explanation;

  int? _questionId;
  int? _selectedIndex;

  Future<void> init(int questionId, int selectedIndex) async {
    _questionId = questionId;
    _selectedIndex = selectedIndex;
    _isLoading = true;
    _error = null;
    _explanation = null;
    _question = null;
    notifyListeners();

    // 1. Buscar a chave API
    final apiKeyResult = await _settingsRepository.getGeminiApiKey();
    if (apiKeyResult.isError()) {
      _setError(
        'Falha ao buscar a chave API Gemini. Verifique as configurações.',
      );
      return;
    }
    final apiKey = apiKeyResult.getOrThrow();

    // 2. Inicializar o modelo Gemini
    try {
      _generativeModel = GenerativeModel(model: _selectedModel, apiKey: apiKey);
    } catch (e) {
      _setError('Falha ao inicializar o modelo Gemini com a chave fornecida.');
      return;
    }

    // 3. Buscar a questão
    final questionResult = await _questionRepository.getMultipleChoiceQuestion(
      questionId,
    );
    if (questionResult.isError()) {
      _setError('Falha ao buscar os detalhes da questão.');
      return;
    }
    _question = questionResult.getOrThrow();

    // 4. Gerar a explicação (implementação pendente)
    await _generateExplanation();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _generateExplanation() async {
    if (_question == null ||
        _selectedIndex == null ||
        _generativeModel == null) {
      _setError('Erro interno: Dados da questão ou modelo AI não disponíveis.');
      return;
    }

    final question = _question!;
    final selectedAnswer = question.alternatives[_selectedIndex!];
    final correctAnswer = question.alternatives[question.correctAnswerIndex];

    // Construir o prompt
    final prompt = """
    Explique de forma clara e concisa por que a resposta para a seguinte questão de múltipla escolha está incorreta e qual é a resposta correta.

    **Questão:**
    ${question.statement}

    **Alternativas:**
    ${question.alternatives.asMap().entries.map((e) => "${String.fromCharCode(65 + e.key)}. ${e.value}").join('\n')}

    **Resposta do Usuário (Incorreta):**
    ${String.fromCharCode(65 + _selectedIndex!)}. $selectedAnswer

    **Resposta Correta:**
    ${String.fromCharCode(65 + question.correctAnswerIndex)}. $correctAnswer

    **Explicação:**
    (Forneça a explicação aqui, focando no erro conceitual do usuário e reforçando o conceito correto. Use markdown para formatação, se necessário.)
    """;

    try {
      final content = [Content.text(prompt)];
      final response = await _generativeModel!.generateContent(content);

      if (response.text != null) {
        _explanation = response.text;
      } else {
        _setError('A API Gemini não retornou uma explicação.');
      }
    } catch (e, s) {
      print('Erro ao chamar a API Gemini: $e\n$s');
      _setError('Falha ao gerar a explicação. Tente novamente mais tarde.');
    }
  }

  void _setError(String errorMessage) {
    _error = errorMessage;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> changeModel(String newModel) async {
    if (_selectedModel != newModel) {
      _selectedModel = newModel;
      _explanation = null;
      notifyListeners();

      if (_questionId != null && _selectedIndex != null) {
        await init(_questionId!, _selectedIndex!);
      }
    }
  }
}
