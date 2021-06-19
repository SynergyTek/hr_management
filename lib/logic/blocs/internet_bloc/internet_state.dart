part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetLoadingState extends InternetState {}

/// InternetConnectState can be of two types:
/// Connected via Wifi or Mobile Data.
class InternetConnectedState extends InternetState {
  final ConnectionType connectionType;
  InternetConnectedState({
    @required this.connectionType,
  });
}

/// InternetDisconnectedState will be when the device is NOT getting internet
/// via any network interface.
class InternetDisconnectedState extends InternetState {}
