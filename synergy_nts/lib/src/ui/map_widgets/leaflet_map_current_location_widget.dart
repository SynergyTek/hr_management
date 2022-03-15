import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import '../../helpers/location_helper/bloc/location_bloc.dart';

class LeafletMapCurrentLocationWidget extends StatelessWidget {
  const LeafletMapCurrentLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        center: LatLng(
          BlocProvider.of<LocationBloc>(context).state.locationData?.latitude ??
              0.0,
          BlocProvider.of<LocationBloc>(context)
                  .state
                  .locationData
                  ?.longitude ??
              0.0,
        ),
        zoom: 15,
        minZoom: 12,
        maxZoom: 18,
      ),
      layers: [
        TileLayerOptions(
          backgroundColor: Colors.transparent,
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          tileProvider: NetworkTileProvider(),
        ),
        MarkerLayerOptions(markers: [
          Marker(
            width: 36.0,
            height: 36.0,
            point: LatLng(
              BlocProvider.of<LocationBloc>(context)
                      .state
                      .locationData
                      ?.latitude ??
                  0.0,
              BlocProvider.of<LocationBloc>(context)
                      .state
                      .locationData
                      ?.longitude ??
                  0.0,
            ),
            builder: (ctx) => Container(
              key: const Key('current location'),
              child: const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 32,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
