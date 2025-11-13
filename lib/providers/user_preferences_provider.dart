import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_logger.dart';
import '../constants/app_constants.dart';
import '../constants/color_constants.dart';

class UserPreferencesProvider with ChangeNotifier {
  String? _userName;
  Color _themeColor = AppColors.defaultThemeColor;
  bool _isFirstLaunch = true;
  bool _isLoading = true;
  bool _isDarkMode = false;
  String? _lastError;

  String? get userName => _userName;
  Color get themeColor => _themeColor;
  bool get isFirstLaunch => _isFirstLaunch;
  bool get isLoading => _isLoading;
  bool get isDarkMode => _isDarkMode;
  String? get lastError => _lastError;

  // Пастельные цвета для выбора
  static List<Map<String, dynamic>> availableColors = AppColors.availableThemeColors;

  UserPreferencesProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      _isFirstLaunch = prefs.getBool(AppConstants.isFirstLaunchKey) ?? true;
      _userName = prefs.getString(AppConstants.userNameKey);
      _isDarkMode = prefs.getBool(AppConstants.isDarkModeKey) ?? false;

      final colorValue = prefs.getInt(AppConstants.themeColorKey);
      if (colorValue != null) {
        _themeColor = Color(colorValue);
      }

      _isLoading = false;
      _lastError = null;
      notifyListeners();
      appLogger.i('User preferences loaded successfully');
    } catch (e, stackTrace) {
      appLogger.e('Failed to load user preferences', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось загрузить настройки';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateUserPreferences(String name, Color color, {bool? isDarkMode}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(AppConstants.userNameKey, name);
      await prefs.setInt(AppConstants.themeColorKey, color.value);
      if (isDarkMode != null) {
        await prefs.setBool(AppConstants.isDarkModeKey, isDarkMode);
        _isDarkMode = isDarkMode;
      }

      _userName = name;
      _themeColor = color;
      _lastError = null;

      notifyListeners();
      appLogger.i('User preferences updated: name=$name, color=${color.value}');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to update user preferences', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось обновить настройки';
      notifyListeners();
      return false;
    }
  }

  Future<bool> toggleDarkMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isDarkMode = !_isDarkMode;
      await prefs.setBool(AppConstants.isDarkModeKey, _isDarkMode);
      _lastError = null;
      notifyListeners();
      appLogger.i('Dark mode toggled: $_isDarkMode');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to toggle dark mode', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось переключить тему';
      _isDarkMode = !_isDarkMode; // Revert the change
      notifyListeners();
      return false;
    }
  }

  Future<bool> saveUserPreferences(String name, Color color) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(AppConstants.userNameKey, name);
      await prefs.setInt(AppConstants.themeColorKey, color.value);
      await prefs.setBool(AppConstants.isFirstLaunchKey, false);

      _userName = name;
      _themeColor = color;
      _isFirstLaunch = false;
      _lastError = null;

      notifyListeners();
      appLogger.i('User preferences saved: name=$name, color=${color.value}');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to save user preferences', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось сохранить настройки';
      notifyListeners();
      return false;
    }
  }

  // Метод для сброса (например, для тестирования)
  Future<bool> resetPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      _userName = null;
      _themeColor = AppColors.defaultThemeColor;
      _isFirstLaunch = true;
      _lastError = null;

      notifyListeners();
      appLogger.i('User preferences reset');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to reset user preferences', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось сбросить настройки';
      notifyListeners();
      return false;
    }
  }

  /// Creates a MaterialColor swatch from a given color
  MaterialColor createMaterialColor(Color color) {
    return AppColors.createMaterialColor(color);
  }

  /// Clears ALL user preferences and resets to defaults
  Future<bool> clearAllPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Remove all user preference keys
      await prefs.remove(AppConstants.userNameKey);
      await prefs.remove(AppConstants.themeColorKey);
      await prefs.remove(AppConstants.isDarkModeKey);
      await prefs.remove(AppConstants.isFirstLaunchKey);

      // Reset to default values
      _userName = null;
      _themeColor = AppColors.defaultThemeColor;
      _isDarkMode = false;
      _isFirstLaunch = true;
      _lastError = null;

      notifyListeners();
      appLogger.i('All user preferences cleared');
      return true;
    } catch (e, stackTrace) {
      appLogger.e('Failed to clear user preferences', error: e, stackTrace: stackTrace);
      _lastError = 'Не удалось очистить настройки';
      return false;
    }
  }

  /// Clears the last error message
  void clearError() {
    _lastError = null;
    notifyListeners();
  }
}

