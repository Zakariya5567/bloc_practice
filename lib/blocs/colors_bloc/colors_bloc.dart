import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/blocs/colors_bloc/colors_events.dart';
import 'package:flutter_bloc_demo/blocs/colors_bloc/colors_states.dart';

class ColorsBloc extends Bloc<ColorEvents, ColorsState> {
  ColorsBloc() : super(ColorInitialState(Colors.teal, "Teal")) {
    on<ColorChangeEvent>((event, emit) {
      return emit(ColorUpdateState(event.color, event.colorName));
    });
  }
}
