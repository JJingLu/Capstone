import 'package:http/http.dart' as http;
import 'dart:convert';

class Chatbotwrapper {
  Future<String> sendHttpPostRequest(String url, Map<String, dynamic> data) async {
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<String> processText(String inputText) async {
    var url = "http://119.28.53.104:8000";
    var data = {"role": "user", "content": inputText};

    try {
      var responseBody = await sendHttpPostRequest(url, data);
      return responseBody;
    } catch (error) {
      return 'Error: $error';
    }
  }
}
