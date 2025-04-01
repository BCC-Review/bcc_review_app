import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/data/services/settings/local_storage_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './settings_repository.dart';

class SettingsRepositoryImpl extends ChangeNotifier
    implements SettingsRepository {
  final LocalStoragePreferencesService _localStoragePreferencesService;
  final Database _database;
  final SharedPreferences _prefs;

  SettingsRepositoryImpl(
    this._localStoragePreferencesService,
    this._database,
    this._prefs,
  ) {
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

  @override
  AsyncResult<Unit> restoreApp() async {
    try {
      await _database.resetAndSeedDatabase(
        prefs: _prefs,
        clearSeedingFlag: false,
      );
      // Opcional: Notificar ouvintes se a restauração afetar algo que a UI observa diretamente do repositório
      // notifyListeners();
      return Success(unit);
    } catch (e, s) {
      return Failure(AppException('Falha ao restaurar o aplicativo: $e', s));
    }
  }
}
