import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/data/repositories/question/question_repository.dart';
import 'package:bcc_review_app/data/repositories/settings/settings_repository.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:result_dart/result_dart.dart';
import 'package:bcc_review_app/core/constants/gemini_models.dart';

class ExplanationViewModel extends ChangeNotifier {
  final QuestionRepository _questionRepository;
  final SettingsRepository _settingsRepository;
  // A instância do GenerativeModel será criada após obter a chave API
  GenerativeModel? _generativeModel;
  String _selectedModel = geminiDefaultModel; // Modelo padrão

  // Lista de modelos disponíveis
  final List<String> availableModels = geminiAvailableModels;

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
    **Contexto:** Você é um tutor paciente e experiente explicando um erro em uma questão de múltipla escolha para um estudante. O objetivo é ajudar o estudante a entender *por que* a resposta dele está errada e *qual* o raciocínio correto.

    **Tarefa:** Forneça uma explicação clara e pedagógica, seguindo a estrutura abaixo.

    **Dados da Questão:**
    *   **Enunciado:** ${question.statement}
    *   **Alternativas:**
        ${question.alternatives.asMap().entries.map((e) => "    ${String.fromCharCode(65 + e.key)}. ${e.value}").join('\n')}
    *   **Resposta do Estudante (Incorreta):** ${String.fromCharCode(65 + _selectedIndex!)}. ${question.alternatives[_selectedIndex!]}
    *   **Resposta Correta:** ${String.fromCharCode(65 + question.correctAnswerIndex)}. ${question.alternatives[question.correctAnswerIndex]}

    **Estrutura da Explicação (Siga esta ordem):**

    1.  **Análise da Resposta do Estudante:**
        *   Comece reconhecendo a resposta escolhida pelo estudante.
        *   Explique **por que a alternativa '${String.fromCharCode(65 + _selectedIndex!)}' está incorreta**. Tente identificar o possível erro de conceito ou a armadilha que pode ter levado a essa escolha. Seja específico sobre o erro naquela alternativa.

    2.  **Explicação da Resposta Correta:**
        *   Apresente a **resposta correta: '${String.fromCharCode(65 + question.correctAnswerIndex)}'**.
        *   Explique **por que esta alternativa é a correta**. Detalhe o conceito, a regra, o cálculo ou o raciocínio que justifica essa escolha. Use exemplos simples, se aplicável.

    3.  **Ponto Chave / Resumo:**
        *   Conclua com uma frase curta que reforce o principal aprendizado ou o conceito fundamental testado pela questão.

    **Diretrizes Adicionais:**
    *   Use **linguagem clara e acessível**, evitando jargões excessivos.
    *   Mantenha um **tom encorajador e didático**.
    *   Use **Markdown** para formatação (negrito **para ênfase**, listas `*` ou `1.` se necessário).
    *   **Foque na compreensão conceitual**, não apenas em dizer "errado" e "certo".
    *   **Seja conciso**, mas garanta que a explicação seja completa para o entendimento do erro.
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
