// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_declarations
import 'package:taiwan_zip/taiwan_zip.dart';
import 'package:test/test.dart';

void main() {
  const Map<String, String> testCases = {
    '104': '臺北市中山區',
    '303': '新竹縣湖口鄉',
    '307': '新竹縣芎林鄉',
    '422': '臺中市石岡區',
    '552': '南投縣集集鎮',
    '646': '雲林縣古坑鄉',
    '701': '臺南市東區',
    '831': '高雄市大寮區',
  };

  const Map<String, String> specialTestCases = {
    '300': '新竹市北區/新竹市東區/新竹市香山區',
    '600': '嘉義市東區/嘉義市西區',
  };

  test('mapping is correct', () {
    expect(mapping.length, 371);
  });

  test('get zipCodes', () {
    expect(TaiwanZip.zipCodes, mapping.values.toSet().toList());
  });

  test('get cities', () {
    expect(TaiwanZip.cities.length, 22);
  });

  group('TaiwanZip', () {
    group('toDistrict', () {
      test('works properly', () {
        testCases.forEach((key, value) {
          expect(TaiwanZip.toDistrict(key), value);
        });
        specialTestCases.forEach((key, value) {
          expect(TaiwanZip.toDistrict(key), value);
        });
      });

      test('throws when zip code is invalid', () {
        expect(() => TaiwanZip.toDistrict('123'),
            throwsA(TypeMatcher<DistrictNotFoundFailure>()));
      });
    });

    group('toZip', () {
      test('works properly', () {
        testCases.forEach((key, value) {
          expect(TaiwanZip.toZip(value), key);
        });
        specialTestCases.forEach((key, value) {
          final testDistricts = value.split('/');
          for (var district in testDistricts) {
            expect(TaiwanZip.toZip(district), key);
          }
        });
      });

      test('throws when 台 is used', () {
        final district = '台北市中正區';
        expect(() => TaiwanZip.toZip(district),
            throwsA(TypeMatcher<IncorrectFormatFailure>()));
      });

      test('throws when district is invalid', () {
        final district = '測試縣無名鎮';
        expect(() => TaiwanZip.toZip(district),
            throwsA(TypeMatcher<ZipCodeNotFoundFailure>()));
      });

      test('throws when the name is not complete', () {
        final district = '中正區';
        expect(() => TaiwanZip.toZip(district),
            throwsA(TypeMatcher<IncorrectFormatFailure>()));
      });
    });

    group('getDistricts', () {
      test('works properly', () {
        final city = '臺北市';
        final actual = TaiwanZip.getDistricts(city);
        expect(actual.length, 12);
      });

      test('works properly with city', () {
        final city = '臺北市';
        final actual = TaiwanZip.getDistricts(city, withCity: true);
        expect(actual.length, 12);
        for (var district in actual) {
          expect(district.contains(city), true);
        }
      });

      test('throws when the city is invalid', () {
        final city = '臺北縣';
        expect(() => TaiwanZip.getDistricts(city),
            throwsA(TypeMatcher<DistrictNotFoundFailure>()));
      });

      test('throws with hint when 台 is provided', () {
        final city = '台北市';
        expect(() => TaiwanZip.getDistricts(city),
            throwsA(TypeMatcher<IncorrectFormatFailure>()));
      });
    });
  });
}
