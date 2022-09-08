import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingCotroller extends ChangeNotifier {
  bool _isActive = false;

  bool get isActive => _isActive;

  int _drpValue = 1;
  int get drpValue => _drpValue;

  set drpValue(value) {
    _drpValue = value;
    notifyListeners();
  }

  set isActive(bool value) {
    _isActive = value;
    notifyListeners();
  }
}

final settingCotrollerProvider = ChangeNotifierProvider((ref) => SettingCotroller());
