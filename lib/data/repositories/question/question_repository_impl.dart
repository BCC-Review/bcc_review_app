import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/question.dart';
import '../../services/question/question_local_service.dart';
import 'question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionLocalService _questionLocalService;

  QuestionRepositoryImpl(this._questionLocalService);

  @override
  AsyncResult<int> addMultipleChoiceQuestion(MultipleChoice question) {
    return _questionLocalService.addMultipleChoiceQuestion(question);
  }

  @override
  AsyncResult<Unit> deleteMultipleChoiceQuestion(int id) {
    return _questionLocalService.deleteMultipleChoiceQuestion(id);
  }

  @override
  AsyncResult<MultipleChoice> getMultipleChoiceQuestion(int id) {
    return _questionLocalService.getMultipleChoiceQuestion(id);
  }

  @override
  AsyncResult<List<MultipleChoice>> getMultipleChoiceQuestions() {
    return _questionLocalService.getMultipleChoiceQuestions();
  }

  @override
  AsyncResult<Unit> updateMultipleChoiceQuestion(MultipleChoice question) {
    return _questionLocalService.updateMultipleChoiceQuestion(question);
  }

  @override
  AsyncResult<List<MultipleChoice>> getQuizQuestions(int moduleId) {
    return _questionLocalService.getQuizQuestions(moduleId);
  }

  @override
  AsyncResult<Unit> addMultipleChoiceQuestions(
    List<MultipleChoice> questions,
    int moduleId,
  ) {
    return _questionLocalService.addMultipleChoiceQuestions(
      questions,
      moduleId,
    );
  }
}
