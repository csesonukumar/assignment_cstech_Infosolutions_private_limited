// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static Future<Map<String, dynamic>> registerUser({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     final response = await http.post(
//       Uri.parse('https://mock-api.calleyacd.com/api/auth/register'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         "username": name,
//         "email": email,
//         "password": password,
//       }),
//     );
//
//     return {
//       'success': response.statusCode == 200,
//       'message': jsonDecode(response.body)['message'],
//     };
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/call_list_model.dart';

class ApiService {
  // User Registration
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

  // Fetch Call List
  static Future<CallListModel> fetchCallList(String listId, String email) async {
    final response = await http.post(
      Uri.parse('https://mock-api.calleyacd.com/api/list/$listId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return CallListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load call list');
    }
  }
}