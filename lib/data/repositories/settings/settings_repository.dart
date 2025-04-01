import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class SettingsRepository extends ChangeNotifier {
  AsyncResult<Unit> toggleDarkMode();
  AsyncResult<Unit> restoreApp();
  bool isDarkMode = false;
}
