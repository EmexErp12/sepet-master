import 'app_constants.dart';

extension DoubleExtension on double {
  bool isInteger() {
    return this == floor();
  }

  double roundDecimal({int decimalPlace = AppConstants.decimalDigitCount}) {
    return double.parse(toStringAsFixed(decimalPlace));
  }

  bool isSmall(int value) => this < value;

  bool isBig(int value) => this > value;
}
