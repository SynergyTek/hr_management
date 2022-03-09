part of 'location_bloc.dart';

abstract class LocationEvent {}

class LocationStartedEvent extends LocationEvent {}

class LocationChangedEvent extends LocationEvent {
  final LocationData locationData;

  LocationChangedEvent({
    required this.locationData,
  });
}

// TODO: add an event when Location is off.
// TODO: add another event when Permissions are denied.
