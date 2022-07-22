import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/enums/enums.dart';

export 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  late StreamSubscription internetStreamSubscription;

  // Initialising the InitialState of the Internet as Loading state.
  InternetBloc({
    required this.connectivity,
  }) : super(InternetDisconnectedState()) {
    internetStreamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
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
      },
    );

    on<InternetConnectedEvent>(
      (event, emit) => emit(
        InternetConnectedState(connectionType: event.connectionType),
      ),
    );

    on<InternetDisconnectedEvent>(
      (event, emit) => emit(
        InternetDisconnectedState(),
      ),
    );
  }

  void dispose() {
    internetStreamSubscription.cancel();
  }
}
