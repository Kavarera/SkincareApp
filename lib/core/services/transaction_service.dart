import 'dart:convert';

import '../api/api_config.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> createTransaction(
      String token, int userId, int productId) async {
    final url = Uri.parse('${ApiConfig.baseUrl + ApiConfig.transaction}');
    try {
      final http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, dynamic>{
            'customerId': userId,
            'productId': productId,
            "amount": 1,
            "type": "QR"
          }));
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data['espay']['qrContent'];
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
      throw Exception(e.toString());
    }
  }
}
