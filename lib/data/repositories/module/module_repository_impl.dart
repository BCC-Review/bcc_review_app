import 'package:bcc_review_app/data/services/module/module_local_service.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:result_dart/result_dart.dart';

import 'module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final ModuleLocalService _moduleLocalService;

  ModuleRepositoryImpl(this._moduleLocalService);

  @override
  AsyncResult<int> addModule(Module module) {
    return _moduleLocalService.addModule(module);
  }

  @override
  AsyncResult<Unit> deleteModule(int id) {
    return _moduleLocalService.deleteModule(id);
  }

  @override
  AsyncResult<Module> getModule(int id) {
    return _moduleLocalService.getModule(id);
  }

  @override
  AsyncResult<List<Module>> getAllModules() {
    return _moduleLocalService.getAllModules();
  }

  @override
  AsyncResult<Unit> updateModule(Module module) {
    return _moduleLocalService.updateModule(module);
  }

  @override
  AsyncResult<List<Module>> getModulesFromSubject(Subject subject) async {
    await subject.modules.load();
    await Future.forEach(subject.modules, (module) async {
      await module.multipleChoiceQuestions.load();
    });
    return Success(subject.modules.toList());
  }
}
