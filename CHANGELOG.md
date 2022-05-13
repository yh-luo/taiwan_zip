# 0.4.0

**Changes**

- Fix the problem when zip code is not unique, `TaiwanZip.toDistrict` only returns the first found district.
    - The structure of the mapping `Map` is reversed: keys become values and values are keys now. That is, districts are used as keys and zip codes are the values.
    - When the zip code maps to multiple districts, they are concatenated with `/` in-between.

# 0.3.0

**Changes**

- 東沙群島 and 南沙群島 were mapped to 高雄市 and 釣魚臺 was mapped to 宜蘭縣. The number of cities is now 24.
- All the functions can be used without an instance, i.e., they are all static functions now.

**Enhancements**

- More informative exceptions
- Better documentation
- Updated README.md

# 0.2.0

**New**

* Getter `zipCodes` returns all the zip codes.
* Getter `cities` returns all the cities.

**Changes**

- `getDistricts` now returns district names without city. Previous behavior equivalent is setting `withCity = true`.

**Enhancements**

* Removed unnecessary dependencies.

# 0.1.0

* Initial development release.