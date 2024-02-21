import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarrentLocationScreen extends StatefulWidget {
  const CarrentLocationScreen({super.key});

  @override
  State<CarrentLocationScreen> createState() => _CarrentLocationScreenState();
}

class _CarrentLocationScreenState extends State<CarrentLocationScreen> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(20.5937, 78.9629), zoom: 14);
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CarrentLocationScreen"),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _daterminePositin();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));
          markers.clear();
          markers.add(Marker(
              markerId: MarkerId("currentLocation"),
              position: LatLng(position.latitude, position.longitude)));
          setState(() {

          });
        },
        label: Text("Current!"),
        icon: Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _daterminePositin() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permision denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Laction permision are permanetly denied");
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
