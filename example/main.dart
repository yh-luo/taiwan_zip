import 'package:taiwan_zip/taiwan_zip.dart';

void main() {
  // `TaiwanZip.cities` returns all the cities in Taiwan.
  print('Cities in Taiwan: ${TaiwanZip.cities}');

  // `TaiwanZip.zipCodes` returns all the zip codes in Taiwan.
  print('There are ${TaiwanZip.zipCodes.length} unique zip codes');

  // Static functions can be used without an instance.
  // `TaiwanZip.toDistrict(zipCode)` finds the district based on the
  var zipCode = '100';
  print('$zipCode refers to ${TaiwanZip.toDistrict(zipCode)}');

  // For some cities, multiple districts use the same zip code. In such cases
  // the districts are separated with '/'.
  var specialZipCode = '300';
  print('$specialZipCode refers to multiple districts: '
      '${TaiwanZip.toDistrict(specialZipCode)}');

  // `TaiwanZip.toZip(district)` finds the zip code of a district.
  // Since the sole district names may duplicate, city prefix is required.
  var district = '臺北市中正區';
  print('$district uses ${TaiwanZip.toZip(district)} as its zip code');

  // `TaiwanZip.getDistricts(city)` returns all the districts in the city the user
  // provided.
  var city = '臺北市';
  print('Districts in $city include ${TaiwanZip.getDistricts(city)}');
}
