import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/test_model.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../utils/theme_utils.dart';
import '../constants/color_constants.dart';
import 'test_screen.dart';

class TestDisclaimerScreen extends StatelessWidget {
  final TestModel test;

  const TestDisclaimerScreen({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    final languageCode = Provider.of<LocaleProvider>(context).locale.languageCode;
    final themeColor = Provider.of<UserPreferencesProvider>(context).themeColor;
    final disclaimer = test.getDisclaimer(languageCode);
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        title: Text(test.getTitle(languageCode)),
        backgroundColor: themeColor,
        foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDisclaimerCard(context, disclaimer ?? '', languageCode),
                ],
              ),
            ),
          ),
          _buildBottomButtons(context, languageCode, themeColor),
        ],
      ),
    );
  }

  Widget _buildDisclaimerCard(BuildContext context, String disclaimer, String languageCode) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeUtils.getCardColor(brightness),
        borderRadius: BorderRadius.circular(15),
        boxShadow: ThemeUtils.getCardShadow(brightness),
      ),
      child: _buildFormattedText(context, disclaimer),
    );
  }

  Widget _buildFormattedText(BuildContext context, String text) {
    final brightness = Theme.of(context).brightness;
    final textColor = ThemeUtils.getBodyTextColor(brightness);
    final parts = text.split('**');
    final List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        // Обычный текст
        spans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: textColor,
          ),
        ));
      } else {
        // Жирный текст (между **)
        spans.add(TextSpan(
          text: parts[i],
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ));
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  Widget _buildBottomButtons(BuildContext context, String languageCode, Color themeColor) {
    final brightness = Theme.of(context).brightness;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeUtils.getCardColor(brightness),
        boxShadow: ThemeUtils.getCardShadow(brightness),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: themeColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                languageCode == 'ru' ? 'Отмена' : 'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: themeColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestScreen(test: test),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: themeColor,
                foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                languageCode == 'ru' ? 'Начать тест' : 'Start Test',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

