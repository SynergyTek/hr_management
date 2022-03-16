import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapsCurrentLocationWidget extends StatefulWidget {
  const GoogleMapsCurrentLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapsCurrentLocationWidget> createState() =>
      _GoogleMapsCurrentLocationWidgetState();
}

class _GoogleMapsCurrentLocationWidgetState
    extends State<GoogleMapsCurrentLocationWidget> {
  //
  Completer<GoogleMapController> controller1 = Completer();
  static LatLng? _initialPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ));

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);

      _markers.add(
        Marker(
          markerId: MarkerId(_initialPosition.toString()),
          position: _initialPosition!,
          infoWindow: InfoWindow(
            title: "Location",
            snippet:
                "(${_initialPosition!.latitude.toStringAsFixed(3)}, ${_initialPosition!.longitude.toStringAsFixed(3)})",
            onTap: () {},
          ),
          onTap: () {},
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _initialPosition == null
        ? const Center(
            child: Text("Loading..."),
          )
        : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition!,
              zoom: 14.4746,
            ),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,

            //
            markers: _markers,
            //
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            //
            compassEnabled: !true,
            myLocationButtonEnabled: !true,
            myLocationEnabled: !true,
          );
  }
}
