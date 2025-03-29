
import 'package:result_dart/result_dart.dart';
import 'package:bcc_review_app/domain/entities/module.dart';

abstract interface class ModuleRpository{
  AsyncResult<List<Module>> getModules();
  AsyncResult<Module> getModule(int id);
  AsyncResult<int> addModule(Module module);
  AsyncResult<Unit> updateModule(Module module);
  AsyncResult<Unit> deleteModule(int id);
}