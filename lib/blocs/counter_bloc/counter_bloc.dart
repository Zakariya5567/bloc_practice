import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_events.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;

  CounterBloc() : super(CounterInitialState()) {
    on<IncrementEvent>((event, emit) {
      counter = counter + 1;
      return emit(CounterUpdateState(counter));
    });

    on<DecrementEvent>((event, emit) {
      if (counter < 1) return;
      counter = counter - 1;
      return emit(CounterUpdateState(counter));
    });

    on<ResetEvent>((event, emit) {
      counter = 0;
      return emit(CounterUpdateState(counter));
    });
  }
}
