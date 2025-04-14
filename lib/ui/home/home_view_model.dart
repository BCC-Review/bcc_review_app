import 'package:asuka/asuka.dart';
import 'package:bcc_review_app/data/repositories/module/module_repository.dart';
import 'package:bcc_review_app/data/repositories/subject/subject_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:bcc_review_app/domain/entities/module.dart';
import 'package:bcc_review_app/domain/entities/subject.dart';
import 'package:bcc_review_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  HomeViewModel(this._userRepository);

  bool isStatsPanelVisible = false;
  bool showStatsPanelContent = false;

  User? user;
  bool isLoading = false;

  Future<void> getUser() async {
    await _userRepository.getUser()
      ..onSuccess((user) {
        this.user = user;
        notifyListeners();
      })
      ..onFailure((error) {
        AsukaSnackbar.alert(error.toString()).show();
      });
  }
}
