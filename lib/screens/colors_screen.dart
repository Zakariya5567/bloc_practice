import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/colors_bloc/colors_bloc.dart';
import 'package:flutter_bloc_demo/blocs/colors_bloc/colors_events.dart';
import 'package:flutter_bloc_demo/blocs/colors_bloc/colors_states.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_events.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_states.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_bloc.dart';

import '../blocs/internet_bloc/internet_state.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Colors",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: SizedBox(
          width: 215,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    context
                        .read<ColorsBloc>()
                        .add(ColorChangeEvent(Colors.red, "Red"));
                  }),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    context
                        .read<ColorsBloc>()
                        .add(ColorChangeEvent(Colors.green, "Green"));
                  }),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    context
                        .read<ColorsBloc>()
                        .add(ColorChangeEvent(Colors.blue, "Blue"));
                  }),
            ],
          ),
        ),
      ),
      body: BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorInitialState) {
          return Center(
            child: Container(
              height: 200,
              width: 200,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: state.color),
              child: Center(
                child: Text(
                  state.colorName.toString(),
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          );
        } else if (state is ColorUpdateState) {
          return Center(
            child: Container(
              height: 200,
              width: 200,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: state.color),
              child: Center(
                child: Text(
                  state.colorName.toString(),
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
