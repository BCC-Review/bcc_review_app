import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:isar/isar.dart';

part 'module.g.dart';

@Collection()
class Module {
  Id? id;
  String name;
  String description;

  @Enumerated(EnumType.name)
  DifficultyLevel difficultyLevel;

  final multipleChoiceQuestions = IsarLinks<MultipleChoice>();
  final subject = IsarLink<Subject>();

  bool isOfficial;

  Module({
    this.id,
    required this.name,
    required this.description,
    required this.difficultyLevel,
    required this.isOfficial,
  });
}

enum DifficultyLevel {
  easy(label: 'Easy'),
  medium(label: 'Medium'),
  hard(label: 'Hard');

  final String label;

  const DifficultyLevel({required this.label});

  String getLabel() {
    return label;
  }
}
