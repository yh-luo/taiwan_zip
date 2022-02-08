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

  test('mapping is correct', () {
    expect(mapping.length, 371);
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
        expect(
            () => TaiwanZip.toZip('測試縣無名鎮'), throwsA(TypeMatcher<Exception>()));
      });
    });
  });
}
