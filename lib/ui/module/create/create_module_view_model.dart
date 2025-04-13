import 'package:flutter/material.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class CreateModuleViewModel extends ChangeNotifier {
  late final createModuleCommand = Command1(_createModule);

  AsyncResult<Module> _createModule(Module module) async {
    // Aqui implementaremos a lógica para salvar o módulo no futuro
    // Por enquanto, apenas simulando um delay
    await Future.delayed(const Duration(seconds: 1));
    return Success(module);
  }
}
