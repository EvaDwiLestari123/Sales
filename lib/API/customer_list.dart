import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sales/Model/customer_model.dart';

// Fungsi untuk mengambil data customer dari API
Future<List<CustomerModel>> fetchCustomers(String token) async {
  final apiUrl = Uri.parse('https://erp.nikici.com/api/customer/?page=1');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Token $token',
  };

  final response = await http.get(apiUrl, headers: headers);

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body)['results'];
    List<CustomerModel> customers = data
        .map(
          (item) => CustomerModel.fromJson(item),
        )
        .toList();
    return customers;
  } else {
    // Jika response gagal, lemparkan error
    throw Exception('Failed to load customers');
  }
}
