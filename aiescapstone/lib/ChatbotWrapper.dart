import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart'; 
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
 


class ChatbotWrapper { 

static Response _requestHandler(Request request) {
  return Response.ok('Request for "${request.url}"');
}

static initCORS() async {
  var handler = const Pipeline()
      // Just add corsHeaders() middleware.
      .addMiddleware(corsHeaders())
      .addHandler(_requestHandler);

  await serve(handler, 'http://119.28.53.104', 8000);
}



static Future<String> processText(String inputText) async {
  final url = Uri.parse('http://119.28.53.104:8000');
  final data = {'message': inputText};

  final client = BrowserClient(); // 使用BrowserClient

  try {
    final response = await client.post( // 使用client.post
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // 请求成功
      return response.body;
    } else {
      // 请求失败
      return 'Http Error: ${response.statusCode} - ${response.reasonPhrase}';
    }
  } catch (e) {
    // 处理其他错误
    return 'Other Error: $e';
  } finally {
    client.close(); // 关闭client
  }
}
}
