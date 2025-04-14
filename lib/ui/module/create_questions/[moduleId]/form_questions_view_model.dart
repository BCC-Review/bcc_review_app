import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:bcc_review_app/data/repositories/question/question_repository.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/domain/validators/question_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class FormQuestionsViewModel extends ChangeNotifier {
  final QuestionRepository _questionRepository;
  final ModuleRepository _moduleRepository;
  final QuestionValidator _questionValidator = QuestionValidator();
  final MultipleChoiceValidator _multipleChoiceValidator =
      MultipleChoiceValidator();

  FormQuestionsViewModel(this._questionRepository, this._moduleRepository);

  final List<MultipleChoice> _questions = [];
  List<MultipleChoice> get questions => List.unmodifiable(_questions);

  // Mapa para armazenar erros de validação por questão e por campo
  // Ex: { 0: {'statement': 'Muito curto', 'alternative_1': 'Vazio'}, 1: {'correctAnswerIndex': 'Inválido'} }
  Map<int, Map<String, String>> _validationErrors = {};
  Map<int, Map<String, String>> get validationErrors =>
      Map.unmodifiable(_validationErrors);

  late final saveQuestionsCommand = Command1(_saveQuestions);

  Module? module;
  Future<void> getModule(int moduleId) async {
    final result = await _moduleRepository.getModule(moduleId);
    result
        .onSuccess((module) {
          this.module = module;
          notifyListeners();
        })
        .onFailure((error) {
          debugPrint('Erro ao obter o módulo: $error');
        });
  }

  // Adiciona uma nova questão em branco à lista
  void addEmptyQuestion() {
    _questions.add(
      MultipleChoice(
        statement: '',
        alternatives: ['', ''], // Começa com 2 alternativas vazias
        correctAnswerIndex: 0,
        xpInitial: 0,
        xpReview: 0,
        isOfficial: false,
      ),
    );
    // Limpa erros da nova questão, se houver
    _validationErrors.remove(_questions.length - 1);
    notifyListeners();
  }

  // Remove uma questão da lista pelo índice
  void removeQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _questions.removeAt(index);
      // Remove erros associados e remapeia os índices dos erros restantes
      _validationErrors.remove(index);
      final newErrors = <int, Map<String, String>>{};
      _validationErrors.forEach((key, value) {
        if (key > index) {
          newErrors[key - 1] = value;
        } else {
          newErrors[key] = value;
        }
      });
      _validationErrors = newErrors;
      notifyListeners();
    }
  }

  // Adiciona uma alternativa vazia a uma questão específica
  void addAlternative(int questionIndex) {
    if (questionIndex >= 0 && questionIndex < _questions.length) {
      _questions[questionIndex].alternatives.add('');
      // Limpa erro específico da nova alternativa, se houver
      _validationErrors[questionIndex]?.remove(
        'alternative_${_questions[questionIndex].alternatives.length - 1}',
      );
      notifyListeners();
    }
  }

  // Remove uma alternativa de uma questão, garantindo o mínimo de 2
  void removeAlternative(int questionIndex, int alternativeIndex) {
    if (questionIndex >= 0 && questionIndex < _questions.length) {
      final question = _questions[questionIndex];
      if (alternativeIndex >= 0 &&
          alternativeIndex < question.alternatives.length &&
          question.alternatives.length > 2) {
        question.alternatives.removeAt(alternativeIndex);
        if (question.correctAnswerIndex >= question.alternatives.length) {
          question.correctAnswerIndex = question.alternatives.length - 1;
        }
        // Remove erros associados e remapeia os índices das alternativas restantes
        _validationErrors[questionIndex]?.remove(
          'alternative_$alternativeIndex',
        );
        final currentErrors = _validationErrors[questionIndex];
        if (currentErrors != null) {
          final newAltErrors = <String, String>{};
          currentErrors.forEach((key, value) {
            if (key.startsWith('alternative_')) {
              final index = int.tryParse(key.split('_').last);
              if (index != null && index > alternativeIndex) {
                newAltErrors['alternative_${index - 1}'] = value;
              } else if (index != null && index < alternativeIndex) {
                newAltErrors[key] = value; // Mantém os anteriores
              }
            } else {
              newAltErrors[key] = value; // Mantém outros erros (statement, etc)
            }
          });
          _validationErrors[questionIndex] = newAltErrors;
        }
        notifyListeners();
      }
    }
  }

  // Atualiza o enunciado de uma questão
  void updateQuestionStatement(int questionIndex, String value) {
    if (questionIndex >= 0 && questionIndex < _questions.length) {
      _questions[questionIndex].statement = value;
      // Limpa erro do enunciado ao digitar
      _validationErrors[questionIndex]?.remove('statement');
      // Notificar pode ser útil se a UI precisar reagir (ex: limpar erro)
      notifyListeners();
    }
  }

  // Atualiza o texto de uma alternativa
  void updateAlternative(
    int questionIndex,
    int alternativeIndex,
    String value,
  ) {
    if (questionIndex >= 0 && questionIndex < _questions.length) {
      final question = _questions[questionIndex];
      if (alternativeIndex >= 0 &&
          alternativeIndex < question.alternatives.length) {
        question.alternatives[alternativeIndex] = value;
        // Limpa erro da alternativa ao digitar
        _validationErrors[questionIndex]?.remove(
          'alternative_$alternativeIndex',
        );
        // Notificar pode ser útil
        notifyListeners();
      }
    }
  }

  // Atualiza o índice da resposta correta
  void updateCorrectAnswerIndex(int questionIndex, int value) {
    if (questionIndex >= 0 && questionIndex < _questions.length) {
      final question = _questions[questionIndex];
      if (value >= 0 && value < question.alternatives.length) {
        question.correctAnswerIndex = value;
        // Limpa erro do índice ao selecionar
        _validationErrors[questionIndex]?.remove('correctAnswerIndex');
        notifyListeners();
      }
    }
  }

  // Função interna para salvar as questões
  AsyncResult<Unit> _saveQuestions(int moduleId) async {
    final bool isValid = _validateAllQuestions();

    notifyListeners();

    if (!isValid) {
      // Retorna uma falha específica para erros de validação
      return Failure(AppException('Por favor, corrija os erros indicados.'));
    }

    final result = await _questionRepository.addMultipleChoiceQuestions(
      _questions,
      moduleId,
    );

    result.onSuccess((_) {
      _validationErrors.clear();
    });

    return result;
  }

  // Valida todas as questões e popula o mapa _validationErrors
  // Retorna true se tudo for válido, false caso contrário.
  bool _validateAllQuestions() {
    _validationErrors.clear(); // Limpa erros anteriores

    if (_questions.isEmpty) {
      // Embora a UI deva impedir isso, adiciona um erro genérico se acontecer
      // Poderia ser um erro global, não associado a um índice específico.
      // Por simplicidade, vamos ignorar por enquanto ou exigir pelo menos uma questão na UI.
      return false; // Considera inválido se não houver questões
    }

    bool allValid = true;

    for (int i = 0; i < _questions.length; i++) {
      final question = _questions[i];
      final errorsForThisQuestion = <String, String>{};

      // Valida campos básicos da questão (enunciado)
      final questionValidationResult = _questionValidator.validate(question);
      if (!questionValidationResult.isValid) {
        allValid = false;
        for (var e in questionValidationResult.exceptions) {
          // Associa o erro ao campo 'statement' (ou outro campo base se houver)
          errorsForThisQuestion[e.key ?? 'statement'] = e.message;
        }
      }

      // Valida campos específicos de MultipleChoice (alternativas, índice)
      final mcValidationResult = _multipleChoiceValidator.validate(question);
      if (!mcValidationResult.isValid) {
        allValid = false;
        for (var e in mcValidationResult.exceptions) {
          // Associa o erro ao campo específico (alternatives, correctAnswerIndex)
          errorsForThisQuestion[e.key ?? 'unknown'] = e.message;
        }
      }

      // Validações manuais adicionais
      for (int j = 0; j < question.alternatives.length; j++) {
        final alternative = question.alternatives[j];
        final key = 'alternative_$j';
        if (alternative.trim().isEmpty) {
          allValid = false;
          errorsForThisQuestion[key] = 'A alternativa não pode estar vazia.';
        } else if (alternative.length > 200) {
          allValid = false;
          errorsForThisQuestion[key] = 'Máximo de 200 caracteres.';
        }
      }

      // Validação manual do índice da resposta correta
      if (question.correctAnswerIndex < 0 ||
          question.correctAnswerIndex >= question.alternatives.length) {
        allValid = false;
        // Adiciona erro mesmo se já houver um do validador, para garantir
        errorsForThisQuestion['correctAnswerIndex'] =
            'Selecione uma resposta válida.';
      }

      // Adiciona os erros encontrados para esta questão ao mapa geral
      if (errorsForThisQuestion.isNotEmpty) {
        _validationErrors[i] = errorsForThisQuestion;
      }
    }

    return allValid;
  }
}
