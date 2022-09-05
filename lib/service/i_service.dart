abstract class IService {
  Future<bool> save(Map<String, dynamic> json);
  Future<Map<String, dynamic>?> get(String key);
}
