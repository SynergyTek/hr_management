part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent extends Equatable {}

/// Events contains all the possible ways the presentation layer (UI)
/// can react to a change in the state.
///
/// Let's consider the example of Internet connectivity.
/// There can be only two events in this example
///  - Connected to Internet, or,
///  - Disconnected from Internet.

class InternetConnectedEvent extends InternetEvent {
  final ConnectionType connectionType;
  InternetConnectedEvent({
    required this.connectionType,
  });

  @override
  List<Object> get props => [connectionType];
}

class InternetDisconnectedEvent extends InternetEvent {
  @override
  List<Object> get props => [];
}
