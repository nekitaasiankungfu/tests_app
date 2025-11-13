import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/mood_check_screen.dart';
import 'providers/test_provider.dart';
import 'providers/locale_provider.dart';
import 'providers/user_preferences_provider.dart';
import 'providers/summary_provider.dart';
import 'providers/category_provider.dart';
import 'constants/color_constants.dart';

void main() {
  runApp(const PsychoTestApp());
}

class PsychoTestApp extends StatelessWidget {
  const PsychoTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => TestProvider()),
        ChangeNotifierProvider(create: (context) => UserPreferencesProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(
          create: (context) {
            final summaryProvider = SummaryProvider();
            // Слушаем изменения языка и очищаем кэш саммари
            final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
            localeProvider.addListener(() async {
              await summaryProvider.onLocaleChanged();
            });
            return summaryProvider;
          },
        ),
      ],
      child: Consumer<UserPreferencesProvider>(
        builder: (context, prefsProvider, child) {
          // Показываем загрузку, пока данные загружаются
          if (prefsProvider.isLoading) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        prefsProvider.themeColor.withOpacity(0.3),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          }

          return Consumer<LocaleProvider>(
            builder: (context, localeProvider, child) {
              return MaterialApp(
                title: localeProvider.isRussian ? 'Психологические тесты' : 'Psychological Tests',
                locale: localeProvider.locale,
                theme: ThemeData(
                  primarySwatch: prefsProvider.createMaterialColor(prefsProvider.themeColor),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: 'Roboto',
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: prefsProvider.themeColor,
                    brightness: Brightness.light,
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  cardColor: Colors.white,
                  dividerColor: Colors.grey[300],
                ),
                darkTheme: ThemeData(
                  primarySwatch: prefsProvider.createMaterialColor(prefsProvider.themeColor),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: 'Roboto',
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: prefsProvider.themeColor,
                    brightness: Brightness.dark,
                  ).copyWith(
                    // Переопределяем основные цвета для лучшего контраста
                    surface: AppColors.darkSurface,
                    surfaceContainerHighest: AppColors.darkSurfaceHighest,
                    surfaceContainerHigh: AppColors.darkSurfaceHigh,
                    surfaceContainer: AppColors.darkSurfaceContainer,
                    surfaceContainerLow: AppColors.darkSurfaceLow,
                    surfaceContainerLowest: AppColors.darkSurfaceLowest,
                    onSurface: Colors.white,
                    onSurfaceVariant: Colors.grey[300]!,
                    outline: Colors.grey[600]!,
                    outlineVariant: Colors.grey[700]!,
                    error: AppColors.darkError,
                    onError: Colors.black,
                    shadow: Colors.black.withOpacity(0.3),
                    scrim: Colors.black.withOpacity(0.5),
                  ),
                  scaffoldBackgroundColor: AppColors.darkBackground,
                  cardColor: AppColors.darkCard,
                  dividerColor: Colors.grey[700],
                  appBarTheme: const AppBarTheme(
                    backgroundColor: AppColors.darkSurface,
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  cardTheme: const CardThemeData(
                    color: AppColors.darkCard,
                    elevation: 2,
                    shadowColor: Colors.black54,
                  ),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: Colors.white),
                    bodyMedium: TextStyle(color: Colors.white),
                    bodySmall: TextStyle(color: Colors.white),
                    titleLarge: TextStyle(color: Colors.white),
                    titleMedium: TextStyle(color: Colors.white),
                    titleSmall: TextStyle(color: Colors.white),
                    labelLarge: TextStyle(color: Colors.white),
                    labelMedium: TextStyle(color: Colors.white),
                    labelSmall: TextStyle(color: Colors.white),
                    headlineLarge: TextStyle(color: Colors.white),
                    headlineMedium: TextStyle(color: Colors.white),
                    headlineSmall: TextStyle(color: Colors.white),
                    displayLarge: TextStyle(color: Colors.white),
                    displayMedium: TextStyle(color: Colors.white),
                    displaySmall: TextStyle(color: Colors.white),
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: AppColors.darkInputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: prefsProvider.themeColor, width: 2),
                    ),
                    labelStyle: TextStyle(color: Colors.grey[300]),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                themeMode: prefsProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                initialRoute: prefsProvider.isFirstLaunch ? '/onboarding' : '/mood-check',
                routes: {
                  '/onboarding': (context) => const OnboardingScreen(),
                  '/mood-check': (context) => const MoodCheckScreen(),
                  '/home': (context) => const HomeScreen(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
