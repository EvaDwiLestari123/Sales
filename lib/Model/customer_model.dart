import 'package:flutter/foundation.dart';
import 'package:sales/API/customer_list.dart';
import 'package:sales/Model/customer_model.dart';

class CustomerProvider with ChangeNotifier {
  List<CustomerModel> _customers = [];

  List<CustomerModel> get customers => _customers;

  void setCustomers(List<CustomerModel> customers) {
    _customers = customers;
    notifyListeners();
  }

  Future<void> loadCustomers(String token) async {
    List<CustomerModel> customers = await fetchCustomers(token);
    setCustomers(customers);
  }
}

class LocationCoordinate {
  final double latitude;
  final double longitude;

  LocationCoordinate({required this.latitude, required this.longitude});

  factory LocationCoordinate.fromJson(Map<String, dynamic> json) {
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class CustomerModel {
  final String id;
  final String name;
  final num contact_number;
  final String address;
  final String location;
  final LocationCoordinate location_coordinate;
  final int company_profile;

  CustomerModel(
      {required this.id,
      required this.name,
      required this.contact_number,
      required this.address,
      required this.location,
      required this.location_coordinate,
      required this.company_profile});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        id: json['id'],
        name: json['name'],
        contact_number: json['contact_number'],
        address: json['address'],
        location: json['location'],
        location_coordinate: LocationCoordinate.fromJson(
            json['location_coordinate'] as Map<String, dynamic>),
        company_profile: json['company_profile']);
  }
}
