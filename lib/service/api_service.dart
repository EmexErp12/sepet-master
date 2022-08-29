import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> get(String basePath, String path) async {
    var url = Uri.https(basePath, path);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //Get.snackbar(AppConstants.appName, response.body);
      return null;
    }
  }
}
