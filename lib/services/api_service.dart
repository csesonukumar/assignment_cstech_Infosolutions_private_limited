import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('https://mock-api.calleyacd.com/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": name,
        "email": email,
        "password": password,
      }),
    );

    return {
      'success': response.statusCode == 200,
      'message': jsonDecode(response.body)['message'],
    };
  }
}