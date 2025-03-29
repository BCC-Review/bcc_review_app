import 'package:bcc_review_app/core/database/database.dart';
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

  AsyncResult<Unit> updateMultipleChoiceQuestion(MultipleChoice question) async {
    try {
      final connection = await _database.connection;
      await connection.multipleChoices.put(question);
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
}
