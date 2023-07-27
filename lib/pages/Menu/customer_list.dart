import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sales/API/customer_list.dart';
import 'package:sales/Model/customer_model.dart';
import '../../Model/customer_model.dart';

class CustomerListPage extends StatelessWidget {
  final String token;

  CustomerListPage({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer List'),
      ),
      body: FutureBuilder<List<CustomerModel>>(
        future: fetchCustomers(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'An error occurred: ${snapshot.error.toString()}')); // Added toString() to properly print the error
          } else if (snapshot.connectionState == ConnectionState.done) {
            // Check if Future is done before accessing data
            List<CustomerModel> customers = snapshot.data!;
            return ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(customers[index].name.toString()),
                  subtitle: Text(customers[index].id.toString()),
                  trailing: Text(
                      'Contact Number: ${customers[index].contact_number.toString()}'),
                );
              },
            );
          } else {
            // This might happen in rare cases where the connection state is neither waiting, done, nor has an error
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
