import 'dart:convert';
import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:sepet/service/i_service.dart';
import 'package:sepet/utilities/app_constants.dart';

class ServiceHive implements IService {
  static ServiceHive? _instance;

  ServiceHive._init();

  static ServiceHive get instance {
    _instance ??= ServiceHive._init();

    return _instance!;
  }

  @override
  Future<Map<String, dynamic>?> get(String key) async {
    var box = await Hive.openBox(key);
    var value = box.get(key);
    if (value != null) {
      return jsonDecode(value);
    }
    return null;
  }

  @override
  Future<bool> save(Map<String, dynamic> json) async {
    var box = await Hive.openBox(AppConstants.hiveSepetKey);
    box.put(AppConstants.hiveSepetKey, jsonEncode(json));
    return true;
  }
}
