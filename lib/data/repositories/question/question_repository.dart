import 'package:result_dart/result_dart.dart';
import '../../../domain/entities/question.dart';

abstract interface class QuestionRepository {
  AsyncResult<List<MultipleChoice>> getMultipleChoiceQuestions();
  AsyncResult<MultipleChoice> getMultipleChoiceQuestion(int id);
  AsyncResult<int> addMultipleChoiceQuestion(MultipleChoice question);
  AsyncResult<Unit> updateMultipleChoiceQuestion(MultipleChoice question);
  AsyncResult<Unit> deleteMultipleChoiceQuestion(int id);
}