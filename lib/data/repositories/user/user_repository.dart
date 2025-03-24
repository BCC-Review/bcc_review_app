import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class UserRepository {
  AsyncResult<User> getUser();
  AsyncResult<User> saveUser(User user);
  AsyncResult<Unit> updateUser(User user);

  AsyncResult<Unit> logout();
}
