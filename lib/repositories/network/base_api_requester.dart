import 'package:http/http.dart' as http;

class BaseApiRequester {
  static Future<http.Response> send(Uri uri) async {
    final response = await http.get(uri);

    return response;
  }
}
