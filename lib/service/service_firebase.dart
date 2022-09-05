import 'package:sepet/service/i_service.dart';

class ServiceFirebase implements IService {
  static ServiceFirebase? _instance;

  ServiceFirebase._init();

  static ServiceFirebase get instance {
    _instance ??= ServiceFirebase._init();
    return _instance!;
  }

  @override
  Future<Map<String, dynamic>?> get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<bool> save(Map<String, dynamic> json) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
