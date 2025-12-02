import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/visual_micro_tests_model.dart';
import '../providers/locale_provider.dart';

/// Results screen for Visual Micro Tests
///
/// Displays top-5 personality traits with descriptions and overall portrait
///
/// @version: 1.0.0
class VisualMicroTestsResultScreen extends StatelessWidget {
  final VisualMicroTestsResult result;

  const VisualMicroTestsResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final locale = localeProvider.languageCode;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale == 'ru' ? 'Ваш профиль' : 'Your Profile',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overall portrait
              _buildOverallPortrait(context, locale, theme),
              const SizedBox(height: 24),

              // Section title
              Text(
                locale == 'ru' ? 'Ваши главные черты' : 'Your Main Traits',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                locale == 'ru'
                    ? 'Топ-5 черт личности, выявленных на основе ваших выборов'
                    : 'Top-5 personality traits revealed by your choices',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),

              // Top-5 traits list
              ...result.topTraits.asMap().entries.map((entry) {
                final index = entry.key;
                final trait = entry.value;
                return _buildTraitCard(context, locale, theme, trait, index + 1);
              }).toList(),

              const SizedBox(height: 24),

              // Explanation section
              _buildExplanationSection(context, locale, theme),

              const SizedBox(height: 32),

              // Action button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  icon: const Icon(Icons.home),
                  label: Text(
                    locale == 'ru' ? 'Вернуться на главную' : 'Return to Home',
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverallPortrait(BuildContext context, String locale, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.psychology,
                size: 32,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                locale == 'ru' ? 'Ваш портрет' : 'Your Portrait',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            result.overallPortrait[locale] ?? result.overallPortrait['en'] ?? '',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraitCard(
    BuildContext context,
    String locale,
    ThemeData theme,
    TraitInfo trait,
    int rank,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Rank badge
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _getRankColor(rank, theme),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$rank',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Icon
                Text(
                  trait.icon ?? '✨',
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(width: 12),

                // Trait name
                Expanded(
                  child: Text(
                    trait.getName(locale),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Score
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${trait.score}',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              trait.getDescription(locale),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRankColor(int rank, ThemeData theme) {
    switch (rank) {
      case 1:
        return Colors.amber.shade600;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.brown.shade400;
      default:
        return theme.colorScheme.primary;
    }
  }

  Widget _buildExplanationSection(BuildContext context, String locale, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 20,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                locale == 'ru' ? 'О результатах' : 'About Results',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            locale == 'ru'
                ? 'Эти черты были выявлены на основе анализа ваших предпочтений в 10 визуальных микротестах. '
                  'Каждый выбор отражает различные аспекты вашей личности: от стиля мышления до эмоциональных реакций.'
                : 'These traits were identified based on analysis of your preferences across 10 visual micro-tests. '
                  'Each choice reflects different aspects of your personality: from thinking style to emotional responses.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

}
