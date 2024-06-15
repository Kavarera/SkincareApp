import 'dart:convert';

import 'package:toko_skincare/core/api/api_config.dart';

import 'package:http/http.dart' as http;

class UserService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('${ApiConfig.baseUrl + ApiConfig.login}');

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to login ${response.reasonPhrase}');
    }
  }
}
