import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id? id;
  String name;
  int level;
  int totalXp;
  int dailySequence;

  User({
    this.id,
    required this.name,
    this.level = 0,
    this.totalXp = 0,
    this.dailySequence = 0,
  });
}
