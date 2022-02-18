[English]() | [正體中文]()

![coverage][coverage_badge]

查詢台灣行政區的郵遞區號。能根據郵遞區號找到行政區，或根據行政區得到郵遞區號。

## 郵遞區號格式

目前只支援中華郵政的三碼郵遞區號，資料來源為中華郵政全球資訊網 [4.1 3+2碼郵遞區號Excel檔 110/09](https://www.post.gov.tw/post/internet/Download/index.jsp?ID=220306)

## 功能

* 回傳台灣所有郵遞區號
* 回傳台灣所有縣市名稱
* 根據行政區名稱回傳郵遞區號
* 根據郵遞區號回傳行政區名稱
* 回傳縣市內所有行政區(區級)

## 範例

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