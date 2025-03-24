import 'package:bcc_review_app/domain/entities/answer_user.dart';
import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id? id;
  String name;
  int level;
  int totalXp;
  int dailySequence;

  final answers = IsarLinks<AnswerUser>();

  User({
    this.id,
    required this.name,
    required this.level,
    required this.totalXp,
    required this.dailySequence,
  });
}
