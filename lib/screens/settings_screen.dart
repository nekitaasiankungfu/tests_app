import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/locale_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../providers/test_provider.dart';
import '../providers/summary_provider.dart';
import '../utils/theme_utils.dart';
import '../constants/color_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  Color? _selectedColor;
  String? _selectedLanguage;
  bool? _isDarkMode;

  @override
  void initState() {
    super.initState();
    final prefsProvider = Provider.of<UserPreferencesProvider>(context, listen: false);
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    
    _nameController.text = prefsProvider.userName ?? '';
    _selectedColor = prefsProvider.themeColor;
    _selectedLanguage = localeProvider.locale.languageCode;
    _isDarkMode = prefsProvider.isDarkMode;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final prefsProvider = Provider.of<UserPreferencesProvider>(context);
    final languageCode = localeProvider.locale.languageCode;
    final themeColor = prefsProvider.themeColor;
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageCode == 'ru' ? 'Настройки' : 'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
          ),
        ),
        backgroundColor: themeColor,
        foregroundColor: ThemeUtils.getAppBarForegroundColor(themeColor, brightness),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ThemeUtils.getScreenGradient(themeColor, brightness),
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildSectionTitle(
                        languageCode == 'ru' ? 'Персональные настройки' : 'Personal Settings',
                        themeColor,
                      ),
                      const SizedBox(height: 20),
                      
                      // Имя пользователя
                      _buildNameSection(languageCode, themeColor),
                      const SizedBox(height: 30),
                      
                      // Цветовая схема
                      _buildColorSection(languageCode, themeColor),
                      const SizedBox(height: 30),
                      
                      // Язык
                      _buildLanguageSection(languageCode, themeColor),
                      const SizedBox(height: 30),
                      
                      // Тёмная тема
                      _buildThemeSection(languageCode, themeColor),
                      const SizedBox(height: 40),

                      // Управление данными
                      _buildDataManagementSection(languageCode, themeColor),
                      const SizedBox(height: 40),

                      // Кнопка сохранения
                      _buildSaveButton(languageCode, themeColor, prefsProvider, localeProvider),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color themeColor) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: themeColor,
      ),
    );
  }

  Widget _buildNameSection(String languageCode, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.grey[700]! 
              : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: themeColor),
              const SizedBox(width: 10),
              Text(
                languageCode == 'ru' ? 'Ваше имя' : 'Your Name',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: languageCode == 'ru' ? 'Введите ваше имя' : 'Enter your name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: themeColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: themeColor, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSection(String languageCode, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.grey[700]! 
              : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.palette, color: themeColor),
              const SizedBox(width: 10),
              Text(
                languageCode == 'ru' ? 'Любимый цвет' : 'Favorite Color',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemCount: UserPreferencesProvider.availableColors.length,
            itemBuilder: (context, index) {
              final colorData = UserPreferencesProvider.availableColors[index];
              final color = colorData['color'] as Color;
              final name = colorData['name'] as String;
              final isSelected = _selectedColor == color;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = color;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected ? Colors.black87 : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.4),
                        blurRadius: isSelected ? 15 : 8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isSelected)
                        Icon(
                          Icons.check,
                          color: ThemeUtils.getButtonTextColor(color),
                          size: 25,
                        ),
                      const SizedBox(height: 5),
                      Text(
                        name,
                        style: TextStyle(
                          color: ThemeUtils.getButtonTextColor(color),
                          fontSize: 11,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSection(String languageCode, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.grey[700]! 
              : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.language, color: themeColor),
              const SizedBox(width: 10),
              Text(
                languageCode == 'ru' ? 'Язык приложения' : 'App Language',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              RadioListTile<String>(
                title: const Text('Русский'),
                subtitle: const Text('Russian'),
                value: 'ru',
                groupValue: _selectedLanguage,
                activeColor: themeColor,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('English'),
                subtitle: const Text('Английский'),
                value: 'en',
                groupValue: _selectedLanguage,
                activeColor: themeColor,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSection(String languageCode, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.grey[700]! 
              : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.dark_mode, color: themeColor),
              const SizedBox(width: 10),
              Text(
                languageCode == 'ru' ? 'Тёмная тема' : 'Dark Theme',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SwitchListTile(
            title: Text(
              languageCode == 'ru' ? 'Включить тёмную тему' : 'Enable Dark Theme',
            ),
            subtitle: Text(
              languageCode == 'ru' 
                  ? 'Переключить между светлой и тёмной темой' 
                  : 'Switch between light and dark theme',
            ),
            value: _isDarkMode ?? false,
            activeColor: themeColor,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(String languageCode, Color themeColor, 
      UserPreferencesProvider prefsProvider, LocaleProvider localeProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_nameController.text.trim().isEmpty || _selectedColor == null || _selectedLanguage == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _selectedLanguage == 'ru' 
                      ? 'Пожалуйста, заполните все поля' 
                      : 'Please fill in all fields'
                ),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }

          // Сохраняем настройки
          await prefsProvider.updateUserPreferences(
            _nameController.text.trim(), 
            _selectedColor!,
            isDarkMode: _isDarkMode,
          );
          
          // Изменяем язык
          localeProvider.setLocale(Locale(_selectedLanguage!));

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _selectedLanguage == 'ru' 
                      ? 'Настройки сохранены!' 
                      : 'Settings saved!'
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
          foregroundColor: ThemeUtils.getButtonTextColor(themeColor),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.save),
            const SizedBox(width: 10),
            Text(
              languageCode == 'ru' ? 'Сохранить настройки' : 'Save Settings',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataManagementSection(String languageCode, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
              const SizedBox(width: 12),
              Text(
                languageCode == 'ru' ? 'Управление данными' : 'Data Management',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            languageCode == 'ru'
                ? 'Удалить АБСОЛЮТНО ВСЕ данные приложения (тесты, саммари, имя, настройки). Приложение будет перезапущено. Это действие нельзя отменить!'
                : 'Delete ABSOLUTELY ALL app data (tests, summary, name, settings). The app will be restarted. This action cannot be undone!',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showClearDataDialog(languageCode),
              icon: const Icon(Icons.delete_forever),
              label: Text(
                languageCode == 'ru' ? 'Очистить все данные' : 'Clear All Data',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showClearDataDialog(String languageCode) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                languageCode == 'ru' ? 'Подтверждение' : 'Confirmation',
              ),
            ),
          ],
        ),
        content: Text(
          languageCode == 'ru'
              ? 'Вы уверены, что хотите удалить АБСОЛЮТНО ВСЕ данные приложения?\n\n• Результаты всех тестов\n• Саммари\n• Ваше имя\n• Настройки темы и языка\n\nПриложение будет перезапущено с начального экрана.\n\nЭто действие НЕЛЬЗЯ отменить!'
              : 'Are you sure you want to delete ABSOLUTELY ALL app data?\n\n• All test results\n• Summary\n• Your name\n• Theme and language settings\n\nThe app will restart from the initial screen.\n\nThis action CANNOT be undone!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              languageCode == 'ru' ? 'Отмена' : 'Cancel',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(languageCode == 'ru' ? 'Удалить' : 'Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await _clearAllData(languageCode);
    }
  }

  Future<void> _clearAllData(String languageCode) async {
    try {
      // Показываем индикатор загрузки
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      // Очищаем данные через провайдеры
      final testProvider = Provider.of<TestProvider>(context, listen: false);
      final summaryProvider = Provider.of<SummaryProvider>(context, listen: false);
      final userPrefsProvider = Provider.of<UserPreferencesProvider>(context, listen: false);
      final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

      // Удаляем ВСЕ данные
      await testProvider.clearAllTests();
      await summaryProvider.clearSummary();
      await userPrefsProvider.clearAllPreferences();
      await localeProvider.resetLocale();

      // Дополнительно: очищаем lastMoodCheckDate
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('lastMoodCheckDate');

      // Закрываем индикатор загрузки
      if (mounted) Navigator.of(context).pop();

      // Перезапускаем приложение - возвращаемся на onboarding
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/onboarding',
          (route) => false, // Удаляем весь стек навигации
        );

        // Показываем сообщение (опционально, пользователь увидит onboarding)
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  languageCode == 'ru'
                      ? 'Все данные успешно удалены! Приложение перезапущено.'
                      : 'All data successfully deleted! App restarted.',
                ),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        });
      }
    } catch (e) {
      // Закрываем индикатор загрузки
      if (mounted) Navigator.of(context).pop();

      // Показываем ошибку
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              languageCode == 'ru'
                  ? 'Ошибка при удалении данных: $e'
                  : 'Error deleting data: $e',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
