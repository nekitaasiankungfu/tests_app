import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/test_category.dart';
import '../utils/app_logger.dart';

/// Provider for managing test category expansion state
class CategoryProvider extends ChangeNotifier {
  static const String _keyPrefix = 'category_expanded_';

  // Map of category ID to expansion state (true = expanded, false = collapsed)
  Map<String, bool> _expandedCategories = {};

  /// Initialize with all categories collapsed by default
  /// Categories always start collapsed on app launch for clean UX
  CategoryProvider() {
    _initializeDefaults();
    // Note: We don't load saved state on initialization
    // Categories always start collapsed for better UX
  }

  /// Initialize all categories as collapsed by default
  void _initializeDefaults() {
    for (final categoryId in TestCategories.getAllIds()) {
      _expandedCategories[categoryId] = false; // All collapsed by default
    }
    appLogger.d('Category states initialized (all collapsed)');
  }

  /// Load expansion state from SharedPreferences
  /// Note: This method is no longer called on initialization
  /// to ensure categories always start collapsed on app launch
  @Deprecated('Categories now always start collapsed on app launch')
  Future<void> _loadState() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      for (final categoryId in TestCategories.getAllIds()) {
        final key = '$_keyPrefix$categoryId';
        final saved = prefs.getBool(key);

        if (saved != null) {
          _expandedCategories[categoryId] = saved;
        }
      }

      appLogger.d('Category states loaded: $_expandedCategories');
      notifyListeners();
    } catch (e, stackTrace) {
      appLogger.e('Failed to load category states', error: e, stackTrace: stackTrace);
    }
  }

  /// Save expansion state to SharedPreferences
  /// Note: Saving is now disabled as categories always start collapsed on app launch
  @Deprecated('Category state is no longer persisted between app launches')
  Future<void> _saveState() async {
    // No longer saving state - categories always start collapsed
    appLogger.d('Category state save skipped (persistence disabled)');
    return;
  }

  /// Check if a category is expanded
  bool isCategoryExpanded(String categoryId) {
    return _expandedCategories[categoryId] ?? false;
  }

  /// Toggle expansion state of a category
  void toggleCategory(String categoryId) {
    _expandedCategories[categoryId] = !isCategoryExpanded(categoryId);
    appLogger.d('Category $categoryId toggled to ${_expandedCategories[categoryId]}');

    notifyListeners();
    _saveState(); // Save immediately after toggle
  }

  /// Expand all categories
  void expandAll() {
    for (final categoryId in TestCategories.getAllIds()) {
      _expandedCategories[categoryId] = true;
    }

    appLogger.d('All categories expanded');
    notifyListeners();
    _saveState();
  }

  /// Collapse all categories
  void collapseAll() {
    for (final categoryId in TestCategories.getAllIds()) {
      _expandedCategories[categoryId] = false;
    }

    appLogger.d('All categories collapsed');
    notifyListeners();
    _saveState();
  }

  /// Get count of expanded categories
  int get expandedCount {
    return _expandedCategories.values.where((expanded) => expanded).length;
  }

  /// Get count of collapsed categories
  int get collapsedCount {
    return _expandedCategories.values.where((expanded) => !expanded).length;
  }
}
