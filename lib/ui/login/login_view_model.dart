import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  LoginViewModel(this._userRepository);

  late final loginCommand = Command1(_login);

  AsyncResult<User> _login(User user) async {
    await Future.delayed(Duration(seconds: 1));
    return _userRepository.saveUser(user);
  }
}
