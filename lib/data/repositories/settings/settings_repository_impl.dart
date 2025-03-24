import 'package:bcc_review_app/data/services/settings/local_storage_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import './settings_repository.dart';

class SettingsRepositoryImpl extends ChangeNotifier
    implements SettingsRepository {
  final LocalStoragePreferencesService _localStoragePreferencesService;

  SettingsRepositoryImpl(this._localStoragePreferencesService) {
    isDarkMode = _localStoragePreferencesService.isDarkMode;
  }
  @override
  bool isDarkMode = false;

  @override
  AsyncResult<Unit> toggleDarkMode() async {
    await _localStoragePreferencesService.toggleDarkMode();
    isDarkMode = !isDarkMode;
    notifyListeners();
    return Success(unit);
  }
}
