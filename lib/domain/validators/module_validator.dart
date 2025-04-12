import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:lucid_validation/lucid_validation.dart';

class ModuleValidator extends LucidValidator<Module> {
  ModuleValidator() {
    ruleFor((m) => m.name, key: 'name')
        .notEmpty(message: 'Nome não pode ser vazio')
        .maxLength(20, message: 'Nome não pode ter mais de 20 caracteres')
        .minLength(3, message: 'Nome deve ter pelo menos 3 caracteres')
        .must(
            (name) => RegExp(r'^[A-Za-zÀ-ÿ\s]+$').hasMatch(name),
            'Nome deve conter apenas letras e espaços',
            ""
        );


    ruleFor((m) => m.description, key: 'description')
        .notEmpty(message: 'Descrição não pode ser vazia')
        .maxLength(30, message: 'Descrição não pode ter mais de 30 caracteres')
        .minLength(3, message: 'Descrição deve ter pelo menos 3 caracteres');
  }
}
