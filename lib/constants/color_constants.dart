import 'package:flutter/material.dart';

/// Application color constants
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Theme Colors - Improved soft & calm palette with better contrast
  // More saturated but still gentle colors for better readability
  static const Color lavender = Color(0xFFB39DDB);      // Soft purple - was too light
  static const Color mint = Color(0xFF81C784);           // Soft green - was too neon
  static const Color peach = Color(0xFFFFAB91);          // Warm coral - more depth
  static const Color skyBlue = Color(0xFF64B5F6);        // Clear blue - better contrast
  static const Color pink = Color(0xFFF48FB1);           // Gentle rose - more visible
  static const Color sage = Color(0xFF90A4AE);           // New: Soft sage gray
  static const Color lavenderLight = Color(0xFFD1C4E9);  // Lighter version for gradients

  // Legacy lemon removed - replaced with sage for professional look

  // Default theme color
  static const Color defaultThemeColor = lavender;

  // Light Theme Colors - for better text contrast
  static const Color lightBackground = Color(0xFFFAFAFA);     // Soft white background
  static const Color lightSurface = Color(0xFFFFFFFF);        // Pure white for cards
  static const Color lightTextPrimary = Color(0xFF212121);    // Dark gray for main text
  static const Color lightTextSecondary = Color(0xFF757575);  // Medium gray for secondary text
  static const Color lightDivider = Color(0xFFE0E0E0);        // Light gray divider

  // Dark Theme Colors
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkSurfaceHighest = Color(0xFF2D2D2D);
  static const Color darkSurfaceHigh = Color(0xFF262626);
  static const Color darkSurfaceContainer = Color(0xFF212121);
  static const Color darkSurfaceLow = Color(0xFF1C1C1C);
  static const Color darkSurfaceLowest = Color(0xFF121212);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkInputFill = Color(0xFF2D2D2D);
  static const Color darkError = Color(0xFFCF6679);

  // Status Colors - accessible in both themes
  static const Color success = Color(0xFF66BB6A);           // Soft green for success
  static const Color warning = Color(0xFFFF9800);           // Warm orange for warnings
  static const Color error = Color(0xFFEF5350);             // Soft red for errors
  static const Color info = Color(0xFF42A5F5);              // Blue for information

  /// Get text color based on background brightness
  /// Returns dark text for light backgrounds and vice versa
  static Color getContrastText(Color backgroundColor) {
    // Calculate relative luminance
    final luminance = backgroundColor.computeLuminance();
    // If background is light, use dark text; if dark, use light text
    return luminance > 0.5 ? lightTextPrimary : Colors.white;
  }

  /// Get lighter version of color for gradients
  static Color getLighterShade(Color color, [double amount = 0.3]) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }

  /// Get darker version of color for accents
  static Color getDarkerShade(Color color, [double amount = 0.2]) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }

  // Available theme colors with names
  static const List<Map<String, dynamic>> availableThemeColors = [
    {'name': 'Лавандовый', 'nameEn': 'Lavender', 'color': lavender},
    {'name': 'Мятный', 'nameEn': 'Mint', 'color': mint},
    {'name': 'Персиковый', 'nameEn': 'Peach', 'color': peach},
    {'name': 'Голубой', 'nameEn': 'Sky Blue', 'color': skyBlue},
    {'name': 'Розовый', 'nameEn': 'Pink', 'color': pink},
    {'name': 'Серо-зелёный', 'nameEn': 'Sage', 'color': sage},
  ];

  /// Creates a MaterialColor from a given color
  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
