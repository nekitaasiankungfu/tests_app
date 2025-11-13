import 'package:flutter_test/flutter_test.dart';
import 'package:psycho_app/config/summary/personality_type_scales.dart';

void main() {
  group('PersonalityTypeScales', () {
    group('convertToBipolarScores', () {
      test('должен правильно конвертировать 8 шкал в 4 биполярные проценты', () {
        // Arrange
        final typeScales = {
          'extraversion': 75.0,
          'introversion': 25.0,
          'sensing': 60.0,
          'intuition': 40.0,
          'thinking': 55.0,
          'feeling': 45.0,
          'judging': 80.0,
          'perceiving': 20.0,
        };

        // Act
        final bipolar = PersonalityTypeScales.convertToBipolarScores(typeScales);

        // Assert - use closeTo for float comparison to avoid precision issues
        expect(bipolar['EI'], closeTo(75.0, 0.01)); // 75/(75+25) = 75%
        expect(bipolar['SN'], closeTo(60.0, 0.01)); // 60/(60+40) = 60%
        expect(bipolar['TF'], closeTo(55.0, 0.01)); // 55/(55+45) = 55%
        expect(bipolar['JP'], closeTo(80.0, 0.01)); // 80/(80+20) = 80%
      });

      test('должен возвращать 50% при равных значениях шкал', () {
        // Arrange
        final typeScales = {
          'extraversion': 50.0,
          'introversion': 50.0,
          'sensing': 30.0,
          'intuition': 30.0,
          'thinking': 100.0,
          'feeling': 100.0,
          'judging': 0.0,
          'perceiving': 0.0,
        };

        // Act
        final bipolar = PersonalityTypeScales.convertToBipolarScores(typeScales);

        // Assert
        expect(bipolar['EI'], equals(50.0)); // Равные значения
        expect(bipolar['SN'], equals(50.0)); // Равные значения
        expect(bipolar['TF'], equals(50.0)); // Равные значения
        expect(bipolar['JP'], equals(50.0)); // Оба нулевые - баланс
      });

      test('должен обрабатывать отсутствующие значения как 0', () {
        // Arrange - неполные данные
        final typeScales = {
          'extraversion': 80.0,
          // introversion отсутствует
          'sensing': 70.0,
          'intuition': 30.0,
        };

        // Act
        final bipolar = PersonalityTypeScales.convertToBipolarScores(typeScales);

        // Assert
        expect(bipolar['EI'], equals(100.0)); // 80/(80+0) = 100%
        expect(bipolar['SN'], equals(70.0));  // 70/(70+30) = 70%
        expect(bipolar['TF'], equals(50.0));  // Оба отсутствуют
        expect(bipolar['JP'], equals(50.0));  // Оба отсутствуют
      });
    });

    group('determineTypeCode', () {
      test('должен определить тип ENFP', () {
        // Arrange
        final typeScales = {
          'extraversion': 65.0,
          'introversion': 35.0,
          'sensing': 40.0,
          'intuition': 60.0,
          'thinking': 45.0,
          'feeling': 55.0,
          'judging': 30.0,
          'perceiving': 70.0,
        };

        // Act
        final type = PersonalityTypeScales.determineTypeCode(typeScales);

        // Assert
        expect(type, equals('ENFP'));
      });

      test('должен определить тип ISTJ', () {
        // Arrange
        final typeScales = {
          'extraversion': 30.0,
          'introversion': 70.0,
          'sensing': 75.0,
          'intuition': 25.0,
          'thinking': 60.0,
          'feeling': 40.0,
          'judging': 85.0,
          'perceiving': 15.0,
        };

        // Act
        final type = PersonalityTypeScales.determineTypeCode(typeScales);

        // Assert
        expect(type, equals('ISTJ'));
      });

      test('должен возвращать X для сбалансированных измерений', () {
        // Arrange
        final typeScales = {
          'extraversion': 50.0,
          'introversion': 50.0,
          'sensing': 50.0,
          'intuition': 50.0,
          'thinking': 50.0,
          'feeling': 50.0,
          'judging': 50.0,
          'perceiving': 50.0,
        };

        // Act
        final type = PersonalityTypeScales.determineTypeCode(typeScales);

        // Assert
        expect(type, equals('XXXX')); // Все измерения сбалансированы
      });

      test('должен определить частичный тип с X для баланса', () {
        // Arrange
        final typeScales = {
          'extraversion': 80.0,
          'introversion': 20.0,
          'sensing': 50.0, // Баланс
          'intuition': 50.0,
          'thinking': 65.0,
          'feeling': 35.0,
          'judging': 50.0, // Баланс
          'perceiving': 50.0,
        };

        // Act
        final type = PersonalityTypeScales.determineTypeCode(typeScales);

        // Assert
        expect(type, equals('EXTX'));
      });
    });

    group('getDominantScale', () {
      test('должен определить доминирующую шкалу экстраверсии', () {
        // Arrange
        final typeScales = {
          'extraversion': 75.0,
          'introversion': 25.0,
        };

        // Act
        final (scale, percentage) = PersonalityTypeScales.getDominantScale('EI', typeScales);

        // Assert
        expect(scale, equals('extraversion'));
        expect(percentage, equals(75.0)); // 75/(75+25) = 75%
      });

      test('должен определить доминирующую шкалу интроверсии', () {
        // Arrange
        final typeScales = {
          'extraversion': 30.0,
          'introversion': 70.0,
        };

        // Act
        final (scale, percentage) = PersonalityTypeScales.getDominantScale('EI', typeScales);

        // Assert
        expect(scale, equals('introversion'));
        expect(percentage, equals(70.0)); // 70/(30+70) = 70%
      });

      test('должен возвращать 50% при отсутствии данных', () {
        // Arrange
        final typeScales = <String, double>{};

        // Act
        final (scale, percentage) = PersonalityTypeScales.getDominantScale('EI', typeScales);

        // Assert
        expect(scale, equals('')); // Нет доминирующей
        expect(percentage, equals(50.0)); // Баланс по умолчанию
      });
    });

    group('getUIDisplayData', () {
      test('должен создать данные для UI с доминирующими полюсами', () {
        // Arrange
        final typeScales = {
          'extraversion': 70.0,
          'introversion': 30.0,
          'sensing': 65.0,
          'intuition': 35.0,
          'thinking': 60.0,
          'feeling': 40.0,
          'judging': 55.0,
          'perceiving': 45.0,
        };

        // Act
        final displayData = PersonalityTypeScales.getUIDisplayData(typeScales, 'ru');

        // Assert
        expect(displayData['EI']?['letter'], equals('E'));
        expect(displayData['EI']?['name'], equals('Экстраверсия'));
        expect(displayData['EI']?['percentage'], equals(70.0));
        expect(displayData['EI']?['isDominant'], isTrue);

        expect(displayData['SN']?['letter'], equals('S'));
        expect(displayData['SN']?['name'], equals('Сенсорика'));

        expect(displayData['TF']?['letter'], equals('T'));
        expect(displayData['TF']?['name'], equals('Мышление'));

        expect(displayData['JP']?['letter'], equals('J'));
        expect(displayData['JP']?['name'], equals('Суждение'));
      });

      test('должен использовать английские названия для en', () {
        // Arrange
        final typeScales = {
          'extraversion': 80.0,
          'introversion': 20.0,
          'sensing': 30.0,
          'intuition': 70.0,
          'thinking': 40.0,
          'feeling': 60.0,
          'judging': 45.0,
          'perceiving': 55.0,
        };

        // Act
        final displayData = PersonalityTypeScales.getUIDisplayData(typeScales, 'en');

        // Assert
        expect(displayData['EI']?['name'], equals('Extraversion'));
        expect(displayData['SN']?['name'], equals('Intuition'));
        expect(displayData['TF']?['name'], equals('Feeling'));
        expect(displayData['JP']?['name'], equals('Perceiving'));
      });

      test('должен правильно определять цвета и иконки', () {
        // Arrange
        final typeScales = {
          'extraversion': 60.0,
          'introversion': 40.0,
        };

        // Act
        final displayData = PersonalityTypeScales.getUIDisplayData(typeScales, 'ru');

        // Assert
        expect(displayData['EI']?['color'], isNotNull);
        expect(displayData['EI']?['icon'], isNotNull);
      });
    });

    group('PersonalityTypeUtils', () {
      test('isPersonalityTypeTest должен определять тест 16 типов', () {
        expect(PersonalityTypeUtils.isPersonalityTypeTest('sixteen_types'), isTrue);
        expect(PersonalityTypeUtils.isPersonalityTypeTest('ipip_big_five'), isFalse);
        expect(PersonalityTypeUtils.isPersonalityTypeTest('fisher_temperament'), isFalse);
      });

      test('getAllScaleIds должен возвращать все 8 шкал', () {
        final scaleIds = PersonalityTypeUtils.getAllScaleIds();

        expect(scaleIds.length, equals(8));
        expect(scaleIds, contains('extraversion'));
        expect(scaleIds, contains('introversion'));
        expect(scaleIds, contains('sensing'));
        expect(scaleIds, contains('intuition'));
        expect(scaleIds, contains('thinking'));
        expect(scaleIds, contains('feeling'));
        expect(scaleIds, contains('judging'));
        expect(scaleIds, contains('perceiving'));
      });

      test('hasCompleteScores должен проверять полноту данных', () {
        // Полные данные
        final completeScores = {
          'extraversion': 70.0,
          'introversion': 30.0,
          'sensing': 60.0,
          'intuition': 40.0,
          'thinking': 55.0,
          'feeling': 45.0,
          'judging': 65.0,
          'perceiving': 35.0,
        };
        expect(PersonalityTypeUtils.hasCompleteScores(completeScores), isTrue);

        // Неполные данные
        final incompleteScores = {
          'extraversion': 70.0,
          'introversion': 30.0,
          // Остальные отсутствуют
        };
        expect(PersonalityTypeUtils.hasCompleteScores(incompleteScores), isFalse);

        // Пустые данные
        expect(PersonalityTypeUtils.hasCompleteScores({}), isFalse);
      });
    });

    group('getScalesForDimension', () {
      test('должен возвращать правильные шкалы для каждого измерения', () {
        // EI dimension
        final eiScales = PersonalityTypeScales.getScalesForDimension('EI');
        expect(eiScales.length, equals(2));
        expect(eiScales.keys, contains('extraversion'));
        expect(eiScales.keys, contains('introversion'));

        // SN dimension
        final snScales = PersonalityTypeScales.getScalesForDimension('SN');
        expect(snScales.length, equals(2));
        expect(snScales.keys, contains('sensing'));
        expect(snScales.keys, contains('intuition'));

        // TF dimension
        final tfScales = PersonalityTypeScales.getScalesForDimension('TF');
        expect(tfScales.length, equals(2));
        expect(tfScales.keys, contains('thinking'));
        expect(tfScales.keys, contains('feeling'));

        // JP dimension
        final jpScales = PersonalityTypeScales.getScalesForDimension('JP');
        expect(jpScales.length, equals(2));
        expect(jpScales.keys, contains('judging'));
        expect(jpScales.keys, contains('perceiving'));
      });
    });

    group('Edge cases', () {
      test('должен обрабатывать очень маленькие значения', () {
        final typeScales = {
          'extraversion': 0.1,
          'introversion': 0.1,
          'sensing': 0.001,
          'intuition': 0.002,
          'thinking': 0.0,
          'feeling': 0.0,
          'judging': 1.0,
          'perceiving': 0.0,
        };

        final bipolar = PersonalityTypeScales.convertToBipolarScores(typeScales);
        final type = PersonalityTypeScales.determineTypeCode(typeScales);

        expect(bipolar['EI'], equals(50.0)); // 0.1/(0.1+0.1) = 50%
        expect(bipolar['SN'], closeTo(33.33, 0.01)); // 0.001/(0.001+0.002)
        expect(bipolar['TF'], equals(50.0)); // Оба нули
        expect(bipolar['JP'], equals(100.0)); // 1.0/(1.0+0) = 100%

        expect(type[0], equals('X')); // Balanced E-I
        expect(type[1], equals('N')); // Intuition dominant
        expect(type[2], equals('X')); // Balanced T-F
        expect(type[3], equals('J')); // Judging dominant
      });

      test('должен обрабатывать очень большие значения', () {
        final typeScales = {
          'extraversion': 999999.0,
          'introversion': 1.0,
          'sensing': 1000000.0,
          'intuition': 1000000.0,
          'thinking': 500.0,
          'feeling': 1500.0,
          'judging': 0.0,
          'perceiving': 100.0,
        };

        final bipolar = PersonalityTypeScales.convertToBipolarScores(typeScales);
        final type = PersonalityTypeScales.determineTypeCode(typeScales);

        expect(bipolar['EI'], closeTo(99.9999, 0.001)); // Почти 100%
        expect(bipolar['SN'], equals(50.0)); // Равные большие значения
        expect(bipolar['TF'], equals(25.0)); // 500/(500+1500) = 25%
        expect(bipolar['JP'], equals(0.0)); // 0/(0+100) = 0%

        expect(type, equals('EXFP'));
      });
    });
  });
}