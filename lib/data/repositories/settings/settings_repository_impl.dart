import 'package:bcc_review_app/core/database/database.dart';
import 'package:bcc_review_app/core/exceptions/app_exception.dart';
import 'package:bcc_review_app/data/services/settings/local_storage_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './settings_repository.dart';

class SettingsRepositoryImpl extends ChangeNotifier
    implements SettingsRepository {
  final LocalStoragePreferencesService _localStoragePreferencesService;
  final Database _database;
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;
  static const String _geminiApiKeyKey = 'gemini_api_key';

  SettingsRepositoryImpl(
    this._localStoragePreferencesService,
    this._database,
    this._prefs,
  ) : _secureStorage = const FlutterSecureStorage() {
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

  @override
  AsyncResult<Unit> saveGeminiApiKey(String apiKey) async {
    try {
      await _secureStorage.write(key: _geminiApiKeyKey, value: apiKey);
      notifyListeners();
      return Success(unit);
    } catch (e, s) {
      return Failure(
        AppException('Falha ao salvar a chave da API Gemini: $e', s),
      );
    }
  }

  @override
  AsyncResult<String> getGeminiApiKey() async {
    try {
      final apiKey = await _secureStorage.read(key: _geminiApiKeyKey);
      if (apiKey == null) {
        return Failure(
          AppException(
            'Chave da API Gemini não encontrada',
            StackTrace.current,
          ),
        );
      }
      return Success(apiKey);
    } catch (e, s) {
      return Failure(
        AppException('Falha ao recuperar a chave da API Gemini: $e', s),
      );
    }
  }

  @override
  AsyncResult<Unit> deleteGeminiApiKey() async {
    try {
      await _secureStorage.delete(key: _geminiApiKeyKey);
      notifyListeners();
      return Success(unit);
    } catch (e, s) {
      return Failure(
        AppException('Falha ao excluir a chave da API Gemini: $e', s),
      );
    }
  }
}
