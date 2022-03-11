// coverage:ignore-file
part of 'taiwan_zip.dart';

class DistrictNotFoundFailure implements Exception {
  const DistrictNotFoundFailure(this.input);
  final String input;

  @override
  String toString() {
    return 'Unable to find district for $input';
  }
}

class IncorrectFormatFailure implements Exception {
  const IncorrectFormatFailure(this.message);
  final String? message;

  @override
  String toString() {
    return 'Incorrect format. ${message ?? ''}';
  }
}

class ZipCodeNotFoundFailure implements Exception {
  const ZipCodeNotFoundFailure(this.district);
  final String district;

  @override
  String toString() {
    return 'Unable to find district for $district';
  }
}
