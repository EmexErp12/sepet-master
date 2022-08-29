import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

class AppConstants {
  static const String appName = 'Sepet';

  static const EdgeInsets padding = EdgeInsets.all(6.0);

  static const int decimalDigitCount = 2;
  static const String currency = '₺';
  static var format = NumberFormat.currency(locale: 'tr-TR', decimalDigits: decimalDigitCount, symbol: currency);

  static const String fontFamily = 'BrandonText';

  static const String hiveSepetKey = 'hiveSepetKey';
}
