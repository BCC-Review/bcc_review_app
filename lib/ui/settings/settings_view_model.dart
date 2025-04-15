import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/data/repositories/settings/settings_repository.dart';
import 'package:bcc_review_app/data/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class SettingsViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  final SettingsRepository _settingsRepository;
  final TextEditingController apiKeyController = TextEditingController();
  String? _apiKey;

  SettingsViewModel(this._userRepository, this._settingsRepository) {
    isDarkMode = _settingsRepository.isDarkMode;
    _loadApiKey();
  }

  late final logoutCommand = Command0(_logout);
  late final restoreAppCommand = Command0(_restoreApp);
  late final saveApiKeyCommand = Command0(_saveApiKey);
  late final deleteApiKeyCommand = Command0(_deleteApiKey);

  AsyncResult<Unit> _logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _userRepository.logout();
  }

  AsyncResult<Unit> _restoreApp() async {
    // Simula um pequeno delay para feedback visual
    await Future.delayed(const Duration(milliseconds: 500));
    return _settingsRepository.restoreApp();
  }

  bool isDarkMode = false;

  Future<void> toggleDarkMode() async {
    isDarkMode = !isDarkMode;
    await _settingsRepository.toggleDarkMode();
    notifyListeners();
  }

  Future<void> _loadApiKey() async {
    final result = await _settingsRepository.getGeminiApiKey();
    result.fold(
      (success) {
        _apiKey = success;
        apiKeyController.text = success;
      },
      (failure) {
        _apiKey = null;
        apiKeyController.clear();
      },
    );
    notifyListeners();
  }

  AsyncResult<Unit> _saveApiKey() async {
    final apiKey = apiKeyController.text.trim();
    if (apiKey.isEmpty) {
      return Failure(
        AppException('A chave da API não pode estar vazia', StackTrace.current),
      );
    }

    final result = await _settingsRepository.saveGeminiApiKey(apiKey);
    result.fold(
      (success) {
        _apiKey = apiKey;
        notifyListeners();
      },
      (failure) {
        // Mantém o estado anterior em caso de falha
      },
    );
    return result;
  }

  AsyncResult<Unit> _deleteApiKey() async {
    final result = await _settingsRepository.deleteGeminiApiKey();
    result.fold(
      (success) {
        _apiKey = null;
        apiKeyController.clear();
        notifyListeners();
      },
      (failure) {
        // Mantém o estado anterior em caso de falha
      },
    );
    return result;
  }

  String? get apiKey => _apiKey;

  @override
  void dispose() {
    apiKeyController.dispose();
    super.dispose();
  }
}
