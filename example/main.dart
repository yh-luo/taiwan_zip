import 'package:taiwan_zip/taiwan_zip.dart';

void main() {
  // `cities` returns all the cities in Taiwan.
  print('Cities in Taiwan: ${TaiwanZip.cities}');

  // `zipCodes` returns all the zip codes in Taiwan.
  print('There are ${TaiwanZip.zipCodes.length} unique zip codes');

  // Static functions can be used without an instance.
  // `TaiwanZip.toDistrict` finds the district based on the
  // zip code.
  var zipCode = '100';
  print('$zipCode refers to ${TaiwanZip.toDistrict(zipCode)}');

  // `TaiwanZip.toZip` finds the zip code of a district.
  // Since the sole district names may duplicate, city prefix is required.
  var district = '臺北市中正區';
  print('$district uses ${TaiwanZip.toZip(district)} as its zip code');

  // `TaiwanZip.getDistricts` returns all the districts in the city the user
  // provided.
  var city = '臺北市';
  print('Districts in $city include ${TaiwanZip.getDistricts(city)}');
}
