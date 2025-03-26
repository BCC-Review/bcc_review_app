import 'package:bcc_review_app/data/repositories/settings/settings_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class SettingsViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  final SettingsRepository _settingsRepository;

  SettingsViewModel(this._userRepository, this._settingsRepository) {
    isDarkMode = _settingsRepository.isDarkMode;
  }

  late final logoutCommand = Command0(_logout);

  AsyncResult<Unit> _logout() async {
    await Future.delayed(const Duration(seconds: 1));
    return _userRepository.logout();
  }

  bool isDarkMode = false;

  Future<void> toggleDarkMode() async {
    isDarkMode = !isDarkMode;
    await _settingsRepository.toggleDarkMode();
    notifyListeners();
  }
}
