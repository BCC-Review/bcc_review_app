import 'package:bcc_review_app/data/exceptions/user_validation_exception.dart';
import 'package:bcc_review_app/data/services/user/user_local_service.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:bcc_review_app/domain/validators/user_validator.dart';
import 'package:result_dart/result_dart.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalService _userLocalService;

  UserRepositoryImpl(this._userLocalService);

  @override
  AsyncResult<User> getUser() async {
    return _userLocalService.getUser();
  }

  @override
  AsyncResult<User> saveUser(User user) async {
    final validator = UserValidator();
    final result = validator.validate(user);
    if (!result.isValid) {
      return Failure(UserValidationException(result.exceptions.first.message));
    }
    return _userLocalService.saveUser(user);
  }

  @override
  AsyncResult<Unit> updateUser(User user) async {
    return _userLocalService.updateUser(user);
  }

  @override
  AsyncResult<Unit> logout() async {
    return _userLocalService.logout();
  }
}
