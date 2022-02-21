import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

part 'location_bloc_event.dart';
part 'location_bloc_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  late bool _serviceEnabled;
  Location location = new Location();
  PermissionStatus? _permissionGranted;

  StreamSubscription<LocationData>? locationStreamSubscription;

  LocationBloc() : super(LocationInitialState());

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationStartedEvent) {
      yield LocationLoadingState();
      _determinePosition();
    } else if (event is LocationChangedEvent) {
      yield LocationLoadSuccessState(
        locationData: event.locationData,
      );
    }
  }

  void dispose() {
    locationStreamSubscription?.cancel();
  }

  Future<bool> isLocationServiceEnabled() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return await location.serviceEnabled();
      }
    }

    return await location.serviceEnabled();
  }

  Future<PermissionStatus> checkForLocationPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return await location.hasPermission();
      }
    }
    return await location.hasPermission();
  }

  _determinePosition() async {
    // Cancel old subscription if any and
    // then start a new location subscription.
    locationStreamSubscription?.cancel();
    location.changeSettings(interval: 5 * 1000);

    // Permissions are denied, next time you could try
    // requesting permissions again (this is also where
    // Android's shouldShowRequestPermissionRationale
    // returned true. According to Android guidelines
    // your App should show an explanatory UI now.
    await checkForLocationPermission();

    // Test if location services are enabled.
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await isLocationServiceEnabled();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // i.e. if everything is fine call the LocationChangedEvent.
    locationStreamSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      add(
        LocationChangedEvent(locationData: currentLocation),
      );
    });
  }
}
