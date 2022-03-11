// ignore_for_file: prefer_const_constructors
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

  test('constructor is unavailable', () {
    expect(() => TaiwanZip(), throwsA(TypeMatcher<UnimplementedError>()));
  });

  test('mapping is correct', () {
    expect(mapping.length, 371);
  });

  test('get zipCodes', () {
    expect(TaiwanZip.zipCodes, mapping.keys.toList());
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
      });

      test('throws when zip code is invalid', () {
        expect(() => TaiwanZip.toDistrict('123'),
            throwsA(TypeMatcher<Exception>()));
      });
    });

    group('toZip', () {
      test('works properly', () {
        testCases.forEach((key, value) {
          expect(TaiwanZip.toZip(value), key);
        });
      });

      test('throws when district is invalid', () {
        var district = '測試縣無名鎮';
        expect(
            () => TaiwanZip.toZip(district), throwsA(TypeMatcher<Exception>()));
      });

      test('throws when the name is not complete', () {
        var district = '中正區';
        expect(
            () => TaiwanZip.toZip(district), throwsA(TypeMatcher<Exception>()));
      });
    });

    group('getDistricts', () {
      test('works properly', () {
        var city = '臺北市';
        final actual = TaiwanZip.getDistricts(city);
        expect(actual.length, 12);
      });

      test('works properly with city', () {
        var city = '臺北市';
        final actual = TaiwanZip.getDistricts(city, withCity: true);
        expect(actual.length, 12);
        for (var district in actual) {
          expect(district.contains(city), true);
        }
      });

      test('throws when the city is invalid', () {
        var city = '臺北縣';
        expect(() => TaiwanZip.getDistricts(city),
            throwsA(TypeMatcher<Exception>()));
      });

      test('throws with hint when 台 is provided', () {
        var city = '台北市';
        expect(() => TaiwanZip.getDistricts(city),
            throwsA(TypeMatcher<Exception>()));
      });
    });
  });
}
