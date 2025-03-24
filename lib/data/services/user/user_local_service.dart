import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/data/exceptions/user_local_service_exception.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:isar/isar.dart';
import 'package:result_dart/result_dart.dart';

class UserLocalService {
  final Database _database;

  UserLocalService(this._database);

  AsyncResult<User> getUser() async {
    try {
      final connection = await _database.openConnection();
      final users = await connection.users.where().findAll();

      if (users.isEmpty) {
        return Failure(UserNotFoundException('Nenhum usuário encontrado'));
      }

      return Success(users.first);
    } catch (e, s) {
      return Failure(UserLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<User> saveUser(User user) async {
    try {
      final connection = await _database.openConnection();
      final users = await connection.users.where().findAll();

      if (users.isNotEmpty) {
        return Failure(
          UserAlreadyExistsException(
            'Já existe um usuário cadastrado no sistema',
          ),
        );
      }

      await connection.writeTxn(() async {
        await connection.users.put(user);
      });

      return Success(user);
    } catch (e, s) {
      return Failure(UserLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> updateUser(User user) async {
    try {
      final connection = await _database.openConnection();
      final users = await connection.users.where().findAll();

      if (users.isEmpty) {
        return Failure(UserNotFoundException('Nenhum usuário encontrado'));
      }

      // Garante que está atualizando o usuário existente
      user.id = users.first.id;

      await connection.writeTxn(() async {
        await connection.users.put(user);
      });

      return Success(unit);
    } catch (e, s) {
      return Failure(UserLocalServiceException(e.toString(), s));
    }
  }

  AsyncResult<Unit> logout() async {
    try {
      final connection = await _database.openConnection();
      final users = await connection.users.where().findAll();

      if (users.isEmpty) {
        return Failure(UserNotFoundException('Nenhum usuário encontrado'));
      }

      await connection.writeTxn(() async {
        await connection.users.delete(users.first.id!);
      });

      return Success(unit);
    } catch (e, s) {
      return Failure(UserLocalServiceException(e.toString(), s));
    }
  }
}
