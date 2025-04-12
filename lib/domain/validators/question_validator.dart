import 'package:bcc_review_app/domain/entities/question.dart';
import 'package:lucid_validation/lucid_validation.dart';

class QuestionValidator extends LucidValidator<Question> {
  QuestionValidator() {
    ruleFor((q) => q.statement, key: 'statement')
        .notEmpty(message: 'A questão não pode estar vazia')
        .maxLength(500, message: 'A questão não pode ter mais de 500 caracteres')
        .minLength(10, message: 'A questão deve ter pelo menos 10 caracteres');

    ruleFor((q) => q.xpInitial, key: 'xpInitial')
        .isNotNull(message: 'O XP inicial não pode ser nulo')
        .min(0, message: 'O XP inicial deve ser maior ou igual a 0');

    ruleFor((q) => q.xpReview, key: 'xpReview')
        .isNotNull(message: 'O XP de revisão não pode ser nulo')
        .min(0, message: 'O XP de revisão deve ser maior ou igual a 0');

    ruleFor((q) => q.questionType, key: 'questionType')
        .isNotNull(message: 'O tipo da questão não pode ser nulo');
  }
}

/*
class MultipleChoiceValidator extends LucidValidator<MultipleChoice> {
  MultipleChoiceValidator() {

    ruleFor((mc) => mc.alternatives, key: 'alternatives')
        .isNotNull(message: 'As alternativas não podem ser nulas') // Corrigi a mensagem
        .must((alternatives) => alternatives.length >= 2, 'Deve haver pelo menos duas alternativas', '')
        .list((alternativeRule) => alternativeRule
        .notEmpty(message: 'Cada alternativa não pode estar vazia')
        .maxLength(200, message: 'Cada alternativa não pode ter mais de 200 caracteres'));

    ruleFor((mc) => mc.correctAnswerIndex, key: 'correctAnswerIndex')
        .isNotNull(message: 'O índice da resposta correta não pode ser nulo')
        .min(0, message: 'O índice da resposta correta deve ser maior ou igual a 0')
        .lessThan((mc) => mc.alternatives.length, message: 'O índice da resposta correta deve ser menor que o número de alternativas');
  }
}
 */