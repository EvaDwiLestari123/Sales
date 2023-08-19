import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'dart:convert';

class AddCustomer extends StatefulWidget {
  final String token;
  const AddCustomer({super.key, required this.token});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  String _response = '';

  final _mapController = MapController(
      initMapWithUserPosition: UserTrackingOption(enableTracking: true));

  Future<void> fetchData(
    String token, {
    String name = "Naruto",
    String contact_number = "022",
    String address = "Konoha",
    String location = "-7.844220, 111.478753",
    int company_profile = 1,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
    final url = Uri.parse('https://erp.nikici.com/api/sales/customer/');
    final body = json.encode({
      'name': name,
      'contact_number': contact_number,
      'address': address,
      'location': location,
      'company_profile': company_profile,
    });
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      setState(() {
        _response = response.body;
        print(_response);
      });
    } else {
      setState(() {
        print(response.body);
      });
    }
  }

  double initialDistance = 0.0;
  double minDistanceThreshold = 0.56;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Text('aa'),
      Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1 / 2,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onScaleStart: (details) {
            print(details.pointerCount);
            if (details.pointerCount == 2) {
              initialDistance = details.localFocalPoint.distance;
              print('jarak berdekat' + initialDistance.toString());
            }
          },
          onScaleUpdate: (details) {
            if (details.pointerCount == 2) {
              double currentDistance = details.localFocalPoint.distance;
              if (currentDistance - initialDistance > 0.56) {
                // Run zoomOut() function here
                _mapController.zoomOut();
                initialDistance = currentDistance;
              } else if (initialDistance - currentDistance > 0.56) {
                // Run zoomIn() function here if needed
                _mapController.zoomIn();
                initialDistance = currentDistance;
              }
            }
          },
          child: OSMFlutter(
            onLocationChanged: (p0) {
              print(p0);
            },
            controller: _mapController,
            mapIsLoading: const Center(
              child: CircularProgressIndicator(),
            ),
            osmOption: OSMOption(
              zoomOption: const ZoomOption(
                initZoom: 18,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              isPicker: true,
              showZoomController: true,
              roadConfiguration: RoadOption(
                roadColor: Colors.yellowAccent,
              ),
              markerOption: MarkerOption(
                  defaultMarker: MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                ),
              )),
            ),
          ),
        ),
      ),
      Row(
        children: [
          ElevatedButton(
              onPressed: () async {
                await _mapController.zoomIn();
                ;
              },
              child: Text('-')),
          ElevatedButton(
              onPressed: () async {
                await _mapController.zoomOut();
              },
              child: Text('+')),
          ElevatedButton(
              onPressed: () async {
                await _mapController.centerMap;
              },
              child: Text('center')),
          ElevatedButton(
              onPressed: () async {
                await _mapController.addMarker(
                    GeoPoint(latitude: -7.844220, longitude: 111.478753),
                    markerIcon: MarkerIcon(
                      icon: Icon(
                        Icons.person_pin_circle,
                        color: Colors.blue,
                        size: 56,
                      ),
                    ),
                    angle: pi / 4,
                    iconAnchor: IconAnchor());
              },
              child: Text('customer 1')),
          ElevatedButton(
              onPressed: () async {
                await fetchData(widget.token);
              },
              child: Text('customer 1')),
        ],
      )
    ]));
  }
}
