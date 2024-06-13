import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotWrapper {
  static Future<String> processText(String inputText) async {
    final url = Uri.parse('http://119.28.53.104:8000');
    final data = {'message': inputText};

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // 请求成功
        return (response.body);
      } else {
        // 请求失败
        return ('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      // 处理其他错误
      return ('Error: $e');
    }
  }
}
