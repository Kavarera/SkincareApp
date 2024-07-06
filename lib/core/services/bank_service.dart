import '../api/api_config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BankService {
  Future<List<dynamic>> fetchBank(String token) async {
    final url =
        Uri.parse('${ApiConfig.baseUrl + ApiConfig.users + ApiConfig.bank}');

    try {
      print('Attempting to bank at: $url');
      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      }
      throw Exception('Failed to load banks ${response.reasonPhrase}');
    } catch (e) {
      throw Exception(e);
    }
  }
}
