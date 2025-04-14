import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/data/exceptions/module_local_service_exception.dart';
import 'package:isar/isar.dart';
import 'package:result_dart/result_dart.dart';

import 'package:bcc_review_app/domain/entities/module.dart';

class ModuleLocalService {
  final Database _database;

  ModuleLocalService(this._database);

  AsyncResult<List<Module>> getAllModules() async {
    try {
      final connection = await _database.connection;
      final allModules = await connection.modules.where().findAll();
      for (final module in allModules) {
        await module.multipleChoiceQuestions.load();
      }
      return Success(allModules);
    } catch (e) {
      return Failure(Exception("Erro ao buscar módulos: $e"));
    }
  }

  AsyncResult<List<Module>> getMyModules() async {
    try {
      final connection = await _database.connection;
      final allModules =
          await connection.modules.filter().isOfficialEqualTo(false).findAll();
      for (final module in allModules) {
        await module.multipleChoiceQuestions.load();
      }
      return Success(allModules);
    } catch (e) {
      return Failure(Exception("Erro ao buscar módulos: $e"));
    }
  }

  AsyncResult<Module> getModule(int moduleId) async {
    try {
      final connection = await _database.connection;
      final module = await connection.modules.get(moduleId);
      if (module == null) {
        return Failure(ModuleNotFoundException("Módulo não encontrado"));
      }
      await module.multipleChoiceQuestions.load();
      await module.subject.load();
      return Success(module);
    } catch (e) {
      return Failure(Exception("Erro ao buscar módulo: $e"));
    }
  }

  AsyncResult<int> addModule(Module module) async {
    try {
      final connection = await _database.connection;
      final id = await connection.writeTxn(() async {
        await module.multipleChoiceQuestions.save();
        await module.subject.save();
        return await connection.modules.put(module);
      });

      return Success(id);
    } catch (e) {
      return Failure(Exception("Erro ao adicionar módulo: $e"));
    }
  }

  AsyncResult<Unit> updateModule(Module module) async {
    try {
      final connection = await _database.connection;
      await connection.writeTxn(() async {
        await module.multipleChoiceQuestions.save();
        await module.subject.save();
        await connection.modules.put(module);
      });
      return Success(unit);
    } catch (e) {
      return Failure(Exception("Erro ao atualizar módulo: $e"));
    }
  }

  AsyncResult<Unit> deleteModule(int moduleId) async {
    try {
      final connection = await _database.connection;
      await connection.writeTxn(() async {
        await connection.modules.delete(moduleId);
      });
      return const Success(unit);
    } catch (e) {
      return Failure(Exception("Erro ao deletar módulo: $e"));
    }
  }
}
