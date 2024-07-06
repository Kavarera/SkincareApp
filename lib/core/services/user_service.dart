import 'dart:convert';
import 'package:toko_skincare/app/data/models/account_model.dart';
import 'package:toko_skincare/app/data/models/user_model.dart';
import 'package:toko_skincare/core/api/api_config.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('${ApiConfig.baseUrl + ApiConfig.login}');
    print('Attempting to log in at: $url');

    try {
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
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Reason: ${response.reasonPhrase}');
        if (response.statusCode == 500) {
          final Map<String, dynamic> data = json.decode(response.body);
          throw Exception('Failed to login ${data['message']}');
        }
        throw Exception('Failed to login ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('Failed to login: $e');
    }
  }

  Future<bool> register(String username, String password,
      String? referralCodeUsed, String norek, String bankName) async {
    final url = Uri.parse('${ApiConfig.baseUrl + ApiConfig.registerCustomer}');
    print('Attempting to Register at: $url');

    try {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String?>{
          'username': username,
          'password': password,
          'referralCodeUsed': referralCodeUsed ?? null,
          'noRekening': norek,
          'bankName': bankName
        }),
      );
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        return true;
      } else if (response.statusCode == 500) {
        print(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      } else {
        print('Failed to register. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Reason: ${response.reasonPhrase}');
        throw Exception('Failed to Register ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('Failed to Register: $e');
    }
  }

  Future<List<dynamic>> getUsers(String token) async {
    final url = Uri.parse('${ApiConfig.baseUrl + ApiConfig.users}');
    try {
      print('Attempting to user at: $url');
      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data.runtimeType);
        print(data[11]);
        return data;
      }
      throw Exception('Failed to load users ${response.reasonPhrase}');
    } catch (e) {
      throw Exception(e);
    }
  }
}
