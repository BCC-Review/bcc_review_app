import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:lucid_validation/lucid_validation.dart';

class SubjectValidator extends LucidValidator<Subject> {
  SubjectValidator() {
    ruleFor((s) => s.name, key: 'name')
        .notEmpty(message: 'Nome não pode ser vazio')
        .maxLength(20, message: 'Nome não pode ter mais de 20 caracteres')
        .minLength(3, message: 'Nome deve ter pelo menos 3 caracteres');
    ruleFor((s) => s.description, key: 'description')
        .notEmpty(message: 'Descrição não pode ser vazia')
        .maxLength(30, message: 'Descrição não pode ter mais de 30 caracteres')
        .minLength(3, message: 'Descrição deve ter pelo menos 3 caracteres');

    ruleFor(
      (s) => s.icon,
      key: 'icon',
    ).notEmpty(message: 'Ícone não pode ser vazio');
  }
}
