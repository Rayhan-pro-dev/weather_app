import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String api;
  NetworkHelper({required this.api});
  Future getData() async {
    var url = Uri.parse(api);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
