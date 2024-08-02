import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_events.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_states.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_bloc.dart';

import '../blocs/internet_bloc/internet_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Counter",
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
                  backgroundColor: Colors.teal,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  }),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                  backgroundColor: Colors.teal,
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  }),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                  backgroundColor: Colors.teal,
                  child: const Icon(Icons.loop),
                  onPressed: () {
                    context.read<CounterBloc>().add(ResetEvent());
                  }),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
        if (state is CounterInitialState) {
          return const Center(
            child: Text(
              "Counter is : 0 ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          );
        } else if (state is CounterUpdateState) {
          return Center(
            child: Text(
              "Counter is :  ${state.counterValue.toString()}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
