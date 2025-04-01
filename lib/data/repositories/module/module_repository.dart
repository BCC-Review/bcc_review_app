import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:result_dart/result_dart.dart';
import 'package:bcc_review_app/domain/entities/module.dart';

abstract interface class ModuleRepository {
  AsyncResult<List<Module>> getAllModules();
  AsyncResult<List<Module>> getModulesFromSubject(Subject subject);
  AsyncResult<Module> getModule(int id);
  AsyncResult<int> addModule(Module module);
  AsyncResult<Unit> updateModule(Module module);
  AsyncResult<Unit> deleteModule(int id);
}
