import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:flutter/material.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class CreateModuleViewModel extends ChangeNotifier {
  final ModuleRepository _moduleRepository;

  CreateModuleViewModel(this._moduleRepository);
  late final createModuleCommand = Command1(_createModule);

  AsyncResult<int> _createModule(Module module) async {
    return _moduleRepository.addModule(module);
  }
}
