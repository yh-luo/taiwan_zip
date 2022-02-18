[English](https://github.com/yh-luo/taiwan_zip/blob/main/README.md) | [正體中文](https://github.com/yh-luo/taiwan_zip/blob/main/README_zhTW.md)

![coverage][coverage_badge]

Map zip code to cities in Taiwan.

## Supported formats

This package only supports three-digits zip codes, which are last updated in October 2021.

## Features

* Get all the zip codes in Taiwan
* Get all the cities in Taiwan
* Find the district of a zip code
* Find the three-digits zip code of a district
* Find the districts of a city

## Example

```dart
  // Static functions can be used without an instance.
  // `TaiwanZip.toDistrict` finds the district
  var zipCode = '100';
  print('$zipCode refers to ${TaiwanZip.toDistrict(zipCode)}');
  // `TaiwanZip.toZip` finds the zip code
  var district = '臺北市中正區';
  print('$district uses ${TaiwanZip.toZip(district)} as its zip code');
  // `TaiwanZip.getDistricts` returns all the districts in the city
  var city = '臺北市';
  print('Districts in $city include ${TaiwanZip.getDistricts(city)}');
```

[coverage_badge]: coverage_badge.svg