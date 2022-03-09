part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  final LocationData? locationData;

  const LocationState({
    this.locationData,
  });

  @override
  List<Object?> get props => [locationData!.latitude, locationData!.longitude];
}

class LocationInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadSuccessState extends LocationState {
  final LocationData locationData;

  LocationLoadSuccessState({
    required this.locationData,
  });
}

// TODO: add a state when Location is off.
// TODO: add another state when Permissions are denied.
