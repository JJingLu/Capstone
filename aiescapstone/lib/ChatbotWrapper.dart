import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotWrapper {
  static Future<String> processText(String inputText) async {
    var url = "119.28.53.104:8000";
    var data = {"role": "user", "content": inputText};

    try {
      var response = await http.post(Uri.http(url, ''), body: jsonEncode(data));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      return 'Error: $error';
    }
  }
}
