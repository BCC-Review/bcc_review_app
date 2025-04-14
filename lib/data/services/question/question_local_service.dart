import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:isar/isar.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/question.dart';
import '../../exceptions/question_local_service_exception.dart';

class QuestionLocalService {
  final Database _database;

  QuestionLocalService(this._database);

  AsyncResult<List<MultipleChoice>> getMultipleChoiceQuestions() async {
    try {
      final connection = await _database.connection;
      final allQuestions = await connection.multipleChoices.where().findAll();
      return Success(allQuestions);
    } catch (e, s) {
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<MultipleChoice> getMultipleChoiceQuestion(int questionId) async {
    try {
      final connection = await _database.connection;
      final question = await connection.multipleChoices.get(questionId);
      if (question == null) {
        return Failure(QuestionNotFoundException('Pergunta não encontrada'));
      }
      return Success(question);
    } catch (e, s) {
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<int> addMultipleChoiceQuestion(MultipleChoice question) async {
    try {
      final connection = await _database.connection;
      int id = await connection.multipleChoices.put(question);
      return Success(id);
    } catch (e, s) {
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> updateMultipleChoiceQuestion(
    MultipleChoice question,
  ) async {
    try {
      final connection = await _database.connection;
      connection.writeTxnSync(() {
        connection.multipleChoices.putSync(question);
      });
      return Success(unit);
    } catch (e, s) {
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> deleteMultipleChoiceQuestion(int questionId) async {
    try {
      final connection = await _database.connection;
      await connection.multipleChoices.delete(questionId);
      return Success(unit);
    } catch (e, s) {
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> addMultipleChoiceQuestions(
    List<MultipleChoice> questions,
    int moduleId,
  ) async {
    try {
      final connection = await _database.connection;
      await connection.writeTxn(() async {
        // Buscar o módulo
        final module = await connection.modules.get(moduleId);
        if (module == null) {
          // Lança uma exceção que será capturada pelo catch externo.
          throw QuestionLocalServiceException(
            'Módulo com ID $moduleId não encontrado.',
            StackTrace.current,
          );
        }

        // Iterar e salvar as questões, associando ao módulo
        for (var question in questions) {
          question.module.value = module;
          await question.module.save();

          int id = await connection.multipleChoices.put(question);
          question.id = id; // Atualiza o ID da questão
          module.multipleChoiceQuestions.add(question);
          await module.multipleChoiceQuestions.save();
        }
      });
      return Success(unit);
    } catch (e, s) {
      // Se o erro for a exceção que lançamos, podemos personalizar a mensagem.
      if (e is QuestionLocalServiceException &&
          e.message.contains('Módulo com ID')) {
        return Failure(e);
      }
      // Outros erros genéricos
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<List<MultipleChoice>> getQuizQuestions(int moduleId) async {
    const maxQuestions = 10;
    try {
      final connection = await _database.connection;

      // Buscar o módulo
      final module = await connection.modules.get(moduleId);
      if (module == null) {
        return Failure(QuestionNotFoundException('Módulo não encontrado.'));
      }

      // Carregar todas as questões do módulo
      await module.multipleChoiceQuestions.load();
      final allQuestions = module.multipleChoiceQuestions.toList();

      if (allQuestions.isEmpty) {
        return Failure(
          QuestionNotFoundException(
            'Nenhuma questão encontrada para este módulo.',
          ),
        );
      }

      // Separar questões respondidas e não respondidas
      final notResponded =
          allQuestions.where((q) => !q.isResponded).toList()..shuffle();
      final responded =
          allQuestions.where((q) => q.isResponded).toList()..shuffle();

      // Montar a lista final de até 10 questões
      final List<MultipleChoice> quizQuestions = [];

      // Primeiro adicionar questões não respondidas
      quizQuestions.addAll(notResponded.take(maxQuestions));

      // Se não atingiu o limite, completar com questões já respondidas
      if (quizQuestions.length < maxQuestions) {
        final needed = maxQuestions - quizQuestions.length;
        quizQuestions.addAll(responded.take(needed));
      }

      return Success(quizQuestions);
    } catch (e, s) {
      return Failure(QuestionLocalServiceException(e.toString(), s));
    }
  }
}
