import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_events.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetConnectedEvent>(
        (events, state) => emit(InternetConnectedState()));

    on<InternetDisconnectedEvent>(
        (events, state) => emit(InternetDisconnectedState()));

    streamSubscription = connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        add(InternetConnectedEvent());
      } else {
        add(InternetDisconnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription?.cancel();
    return super.close();
  }
}
