import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/enums/enums.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription internetStreamSubscription;

  // Initialising the InitialState of the Internet as Loading state.
  InternetBloc({
    @required this.connectivity,
  })
  // : super(InternetLoadingState()) {
  : super(InternetDisconnectedState()) {
    internetStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        // add InternetConnectedEvent.
        add(InternetConnectedEvent(
          connectionType: connectivityResult == ConnectivityResult.wifi
              ? ConnectionType.wifi
              : ConnectionType.mobile,
        ));
      } else {
        // add InternetDisconnectedEvent.
        add(InternetDisconnectedEvent());
      }
    });
  }

  @override
  Stream<InternetState> mapEventToState(
    InternetEvent event,
  ) async* {
    if (event is InternetConnectedEvent) {
      yield InternetConnectedState(
        connectionType: event.connectionType,
      );
    } else {
      yield InternetDisconnectedState();
    }
  }

  void dispose() {
    internetStreamSubscription.cancel();
  }
}
