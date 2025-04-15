import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class SettingsRepository extends ChangeNotifier {
  AsyncResult<Unit> toggleDarkMode();
  AsyncResult<Unit> restoreApp();
  bool isDarkMode = false;

  /// Salva a chave da API do Gemini de forma segura
  AsyncResult<Unit> saveGeminiApiKey(String apiKey);

  /// Recupera a chave da API do Gemini armazenada
  AsyncResult<String> getGeminiApiKey();

  /// Remove a chave da API do Gemini
  AsyncResult<Unit> deleteGeminiApiKey();
}
