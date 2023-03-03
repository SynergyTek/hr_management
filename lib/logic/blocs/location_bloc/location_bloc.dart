import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../helper/capture_user_location.dart';

part 'location_bloc_event.dart';
part 'location_bloc_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  late bool _serviceEnabled;
  StreamSubscription<LocationData>? locationStreamSubscription;
  Location location = new Location();
  PermissionStatus? _permissionGranted;
  Duration oneSec = Duration(seconds: 120);
  Timer? timer;

  LocationBloc() : super(LocationInitialState()) {
    locationStreamSubscription =
        locationStreamSubscription = location.onLocationChanged.listen(
      (LocationData currentLocation) {
        add(LocationStartedEvent());
        _determinePosition();
      },
    );

    on<LocationStartedEvent>(
      (event, emit) => emit(
        LocationLoadingState(),
      ),
    );

    on<LocationChangedEvent>(
      (event, emit) => emit(
        LocationLoadSuccessState(
          locationData: event.locationData,
        ),
      ),
    );
  }

  // @override
  // Stream<LocationState> mapEventToState(
  //   LocationEvent event,
  // ) async* {
  //   if (event is LocationStartedEvent) {
  //     yield LocationLoadingState();
  //     _determinePosition();
  //   } else if (event is LocationChangedEvent) {
  //     yield LocationLoadSuccessState(
  //       locationData: event.locationData,
  //     );
  //   }
  // }

  void dispose() {
    locationStreamSubscription?.cancel();
    timer?.cancel();
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
    bool _bgModeEnabled = await location.isBackgroundModeEnabled();
    if (_permissionGranted == PermissionStatus.denied ||
        _bgModeEnabled == false) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted && _bgModeEnabled) {
        return await location.hasPermission();
      } else {
        try {
          await location.enableBackgroundMode();
        } catch (e) {
          debugPrint(e.toString());
        }
        try {
          _bgModeEnabled = await location.enableBackgroundMode();
        } catch (e) {
          debugPrint(e.toString());
        }
        print(_bgModeEnabled); //True!
        return location.hasPermission();
      }
    }
    return await location.hasPermission();
  }

  Future<bool> enableBackgroundMode() async {
    bool _bgModeEnabled = await location.isBackgroundModeEnabled();
    if (_bgModeEnabled) {
      return true;
    } else {
      try {
        await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      try {
        _bgModeEnabled = await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      print(_bgModeEnabled); //True!
      return _bgModeEnabled;
    }
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
    // enableBackgroundMode();
    await checkForLocationPermission();

    // Test if location services are enabled.
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    await isLocationServiceEnabled();

    location.enableBackgroundMode(enable: true);

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // i.e. if everything is fine call the LocationChangedEvent.
    double lastSavedTime = 0;

    locationStreamSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      add(
        LocationChangedEvent(locationData: currentLocation),
      );
      if (currentLocation.time! - lastSavedTime > 100000.0 * 30.0) {
        // timer = Timer?.periodic(oneSec, (Timer t) {
        print("Location Added");
        print(
            "${currentLocation.latitude ?? 0}, ${currentLocation.longitude ?? 0}");
        CaptureUserLocation().captureLocationFn(LatLng(
            currentLocation.latitude ?? 0, currentLocation.longitude ?? 0));
        // lastSavedTime = currentLocation.time ?? 0;
        // });
      }
    });
  }
}
