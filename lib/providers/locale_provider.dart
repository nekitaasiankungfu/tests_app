import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_logger.dart';
import '../constants/app_constants.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale(AppConstants.languageRussian);
  String? _lastError;

  Locale get locale => _locale;
  String? get lastError => _lastError;

  LocaleProvider() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? languageCode = prefs.getString(AppConstants.languageKey);

      if (languageCode != null) {
        _locale = Locale(languageCode);
        appLogger.i('Locale loaded: $languageCode');
      } else {
        appLogger.d('No saved locale, using default: ${_locale.languageCode}');
      }

      _lastError = null;
      notifyListeners();
    } catch (e, stackTrace) {
      appLogger.e('Failed to load locale', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось загрузить настройки языка';
    }
  }

  Future<bool> setLocale(Locale locale) async {
    if (_locale == locale) {
      appLogger.d('Locale unchanged: ${locale.languageCode}');
      return true;
    }

    final oldLocale = _locale;
    _locale = locale;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.languageKey, locale.languageCode);

      // Очистить кэш саммари при изменении языка, чтобы пересчитать с новым языком
      await prefs.remove('user_summary');

      _lastError = null;
      appLogger.i('Locale changed: ${oldLocale.languageCode} → ${locale.languageCode}');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to save locale', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось сохранить настройки языка';
      // Revert the change
      _locale = oldLocale;
      notifyListeners();
      return false;
    }
  }

  bool get isRussian => _locale.languageCode == AppConstants.languageRussian;
  bool get isEnglish => _locale.languageCode == AppConstants.languageEnglish;
  String get languageCode => _locale.languageCode;

  /// Resets locale to default (Russian)
  Future<bool> resetLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConstants.languageKey);

      _locale = const Locale(AppConstants.languageRussian);
      _lastError = null;
      notifyListeners();
      appLogger.i('Locale reset to default: ${_locale.languageCode}');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to reset locale', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось сбросить язык';
      return false;
    }
  }

  /// Clears the last error message
  void clearError() {
    _lastError = null;
    notifyListeners();
  }
}

