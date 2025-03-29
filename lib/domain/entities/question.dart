import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:isar/isar.dart';

part 'question.g.dart';

abstract class Question {
  Id? id;
  String statement;
  int xpInitial;
  int xpReview;

  bool isOfficial;
  bool isResponded;

  final module = IsarLink<Module>();

  @Enumerated(EnumType.name)
  QuestionType questionType;

  Question({
    required this.statement,
    required this.xpInitial,
    required this.xpReview,
    required this.isOfficial,
    required this.questionType,
    this.isResponded = false,
  });

  int getXpValue(bool isInedit) {
    return isInedit ? xpInitial : xpReview;
  }
}

enum QuestionType {
  multipleChoice(label: 'Multiple Choice');

  final String label;

  const QuestionType({required this.label});

  String getLabel() {
    return label;
  }
}

@Collection()
class MultipleChoice extends Question {
  List<String> alternatives;
  int correctAnswerIndex;

  MultipleChoice({
    required super.statement,
    required this.alternatives,
    required this.correctAnswerIndex,
    required super.xpInitial,
    required super.xpReview,
    required super.isOfficial,
  }) : super(questionType: QuestionType.multipleChoice);

  bool checkAnswer(int answerIndex) {
    return answerIndex == correctAnswerIndex;
  }

  List<String> getAlternatives() {
    return alternatives;
  }

  String getAIExplanation() {
    return '-TODO-';
  }
}
