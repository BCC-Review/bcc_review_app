import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  HomeViewModel(this._userRepository);

  User? user;

  late final logoutCommand = Command0(_logout);

  Future<void> getUser(BuildContext context) async {
    await _userRepository.getUser()
      ..onSuccess((user) {
        this.user = user;
        notifyListeners();
      })
      ..onFailure((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      });
  }

  AsyncResult<Unit> _logout() async {
    return _userRepository.logout();
  }
}
