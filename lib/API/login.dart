import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> loginApi(String username, String password) async {
  Uri apiUrl = Uri.parse('https://erp.nikici.com/api/auth/login/');
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  final body = json.encode({
    'username': username,
    'password': password,
  });

  final response = await http.post(apiUrl, headers: headers, body: body);

  print('Response status: ${response.statusCode}');
  print(
    'Response body: ${response.body}',
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    final data = responseJson;

    return data;
  } else {
    throw Exception('Failed to login');
  }
}
