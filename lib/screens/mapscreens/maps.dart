import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'booking.dart';

void main() {
  runApp(MaterialApp(
    home: MapScreen(),
  ));
}

class MapBloc {
  final _currentLocationController = StreamController<LatLng>();
  late GoogleMapController mapController;

  Stream<LatLng> get currentLocation => _currentLocationController.stream;

  void dispose() {
    _currentLocationController.close();
  }

  void getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Handle denied permissions here
      print('Location permission denied');
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      LatLng currentPosition = LatLng(position.latitude, position.longitude);
      _currentLocationController.sink.add(currentPosition);
    } catch (e) {
      print('Error: $e');
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void refreshLocation() {
    getCurrentLocation();
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapBloc _bloc = MapBloc();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc.getCurrentLocation();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: Column(
        children: [
          StreamBuilder<LatLng>(
            stream: _bloc.currentLocation,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildMap(snapshot.data!);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(height: 16),
          TextField(
            controller: fromController,
            decoration: InputDecoration(labelText: 'From'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: toController,
            decoration: InputDecoration(labelText: 'To'),
          ),
          SizedBox(height: 16),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to RideConfirmationScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RideConfirmationScreen(),
                ),
              );
            },
            child: Text('Find Ride'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call function to find the shortest path between "From" and "To" locations
          findShortestPath(fromController.text, toController.text);
        },
        child: Icon(Icons.search),
      ),
    );
  }

  Widget buildMap(LatLng initialPosition) {
    return Expanded(
      child: GoogleMap(
        onMapCreated: _bloc.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 15,
        ),
      ),
    );
  }

  void findShortestPath(String from, String to) {
    // Implement the logic to find the shortest path between "from" and "to"
    // You can use any navigation library or algorithm here
    // For simplicity, let's assume it's a function that calculates and updates the path on the map.
    updatePathOnMap();
  }

  void updatePathOnMap() {
    // Implement the logic to update the path on the map
    // This can involve drawing a route, markers, etc.
  }
}


