import 'package:driver/app_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:map_location_picker/generated/l10n.dart' as location_picker;
import 'package:flutter/services.dart';
import 'package:map_location_picker/google_map_location_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class SearchPlace extends StatefulWidget {
  const SearchPlace({super.key});

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  late GoogleMapController mapController;

  // late LatLng currentPosition;

  LatLng? _currentPosition;

  LatLng basePosition = LatLng(56.324293441187315, 38.13961947281509);

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  var lat, lng;
  bool _isLoading = false;
  getLocation() async {
    setState(() => _isLoading = true);
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
     lat = position.latitude;
     lng = position.longitude;

    LatLng location = LatLng(lat, lng);

    setState(() {
      _currentPosition = location;
    });
    setState(() => _isLoading = false);

  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar ubicación del restaurante',
          style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        ),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : OpenStreetMapSearchAndPick(
        buttonTextStyle:
        const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
        buttonColor: Colors.blue,
        buttonText: 'Establecer ubicación actual',
          center: LatLong(lat, lng),

        onPicked: (pickedData) {
          Navigator.pop(context, {
           "location" : {
             "lat": pickedData.latLong.latitude,
             "lng": pickedData.latLong.longitude,
             "location": pickedData.address,
           }
          });
        },
      ));
  }
}
