part of 'location_bloc.dart';

abstract class LocationEvent {}

class LocationStartedEvent extends LocationEvent {}

class LocationChangedEvent extends LocationEvent {
  final LocationData locationData;

  LocationChangedEvent({
    required this.locationData,
  });
}
