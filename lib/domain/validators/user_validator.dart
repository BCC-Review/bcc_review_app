import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:lucid_validation/lucid_validation.dart';

class UserValidator extends LucidValidator<User> {
  UserValidator() {
    ruleFor((u) => u.name, key: 'name')
        .notEmpty(message: 'Nome não pode ser vazio')
        .maxLength(50, message: 'Nome não pode ter mais de 50 caracteres')
        .minLength(3, message: 'Nome deve ter pelo menos 3 caracteres');

    ruleFor(
      (u) => u.level.toString(),
      key: 'level',
    ).notEmpty(message: 'Nível é obrigatório');

    ruleFor(
      (u) => u.totalXp.toString(),
      key: 'totalXp',
    ).notEmpty(message: 'XP total é obrigatório');

    ruleFor(
      (u) => u.dailySequence.toString(),
      key: 'dailySequence',
    ).notEmpty(message: 'Sequência diária é obrigatória');
  }
}
