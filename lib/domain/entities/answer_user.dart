import 'package:isar/isar.dart';

part 'answer_user.g.dart';

@Collection()
class AnswerUser {
  Id? id;
  int questionId;
  int xpEarned;
  bool correct;

  DateTime answerDate;
  String providedAnswer;

  AnswerUser({
    required this.id,
    required this.questionId,
    required this.xpEarned,
    required this.correct,
    required this.answerDate,
    required this.providedAnswer,
  });
}
