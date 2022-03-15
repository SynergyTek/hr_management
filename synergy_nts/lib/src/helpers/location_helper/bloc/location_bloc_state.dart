part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  final LocationData? locationData;

  const LocationState({
    this.locationData,
  });

  @override
  List<Object?> get props => [locationData];
}

class LocationInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadSuccessState extends LocationState {
  final LocationData locationData;

 const  LocationLoadSuccessState({
    required this.locationData,
  });
}
