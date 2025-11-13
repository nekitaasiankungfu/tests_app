import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

/// Utility functions for theme-aware color selection
class ThemeUtils {
  ThemeUtils._();

  /// Get appropriate text color for AppBar based on background color
  /// Returns white for dark backgrounds, dark for light backgrounds
  static Color getAppBarForegroundColor(Color backgroundColor, Brightness brightness) {
    // In dark mode, always use white
    if (brightness == Brightness.dark) {
      return Colors.white;
    }

    // In light mode, use contrast-based calculation
    return AppColors.getContrastText(backgroundColor);
  }

  /// Get appropriate gradient colors for screen backgrounds
  /// Returns colors suitable for the current theme
  static List<Color> getScreenGradient(Color themeColor, Brightness brightness) {
    if (brightness == Brightness.dark) {
      // Dark theme: theme color to dark background
      return [
        themeColor.withOpacity(0.8),
        themeColor.withOpacity(0.4),
        AppColors.darkBackground,
      ];
    } else {
      // Light theme: lighter shade to white
      return [
        AppColors.getLighterShade(themeColor, 0.4),
        Colors.white.withOpacity(0.95),
        Colors.white,
      ];
    }
  }

  /// Get appropriate text color for body content
  static Color getBodyTextColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? Colors.white
        : AppColors.lightTextPrimary;
  }

  /// Get appropriate secondary text color
  static Color getSecondaryTextColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? Colors.grey[300]!
        : AppColors.lightTextSecondary;
  }

  /// Get appropriate card background color
  static Color getCardColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? AppColors.darkCard
        : AppColors.lightSurface;
  }

  /// Get appropriate divider color
  static Color getDividerColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? Colors.grey[700]!
        : AppColors.lightDivider;
  }

  /// Get shadow color with appropriate opacity
  static List<BoxShadow> getCardShadow(Brightness brightness) {
    return [
      BoxShadow(
        color: brightness == Brightness.dark
            ? Colors.black.withOpacity(0.3)
            : Colors.black.withOpacity(0.08),
        blurRadius: brightness == Brightness.dark ? 10 : 8,
        offset: const Offset(0, 2),
      ),
    ];
  }

  /// Check if a color is light (for determining text color)
  static bool isLightColor(Color color) {
    return color.computeLuminance() > 0.5;
  }

  /// Get button text color based on button background
  static Color getButtonTextColor(Color buttonColor) {
    return isLightColor(buttonColor) ? AppColors.lightTextPrimary : Colors.white;
  }
}
