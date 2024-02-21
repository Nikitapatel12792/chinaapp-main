import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import '../main.dart';




class GoogleMapExample extends StatefulWidget {
  String? id1;

  GoogleMapExample({Key? key,this.id1}) : super(key: key);
  @override
  State<GoogleMapExample> createState() => _GoogleMapExampleState();
}

class _GoogleMapExampleState extends State<GoogleMapExample> {
  bool isLoading = true;
  String? id = "0";
  double? latitude=0.0;
  double? longitude=0.0;
  final Set<Marker> _markers = {};

  // String address = "Surat,Gujarat";
  // var currentLocation = LocationData;
  List<Location>? placemarks;
  GoogleMapController? _controller;

  // final Completer<GoogleMapController> _controller =
  // Completer<GoogleMapController>();
  getaddress() async {
    List<Location> locations = await locationFromAddress(widget.id1.toString());
    Location location = locations.first;
    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getaddress();


    // _timer = Timer.periodic(Duration(seconds: 10), (Timer t) => getLocation());
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: LatLng(latitude!, longitude!),
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 0),
    };
  }

  void _onMapCreated(GoogleMapController controller) {
    // _controlle?.complete(controller);
    setState(() {
      _controller = controller;
      Marker(
          markerId: MarkerId("marker_1"),
          position: LatLng(latitude!, longitude!),
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      GoogleMap(
        compassEnabled: false,
        myLocationButtonEnabled: false,

        // minMaxZoomPreference:
        // MinMaxZoomPreference(0, 5),
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,

        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(latitude!, longitude!),
            zoom: 3
        ),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        markers: _createMarker(),
      ),

    );
  }
}