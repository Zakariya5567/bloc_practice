import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_demo/widgets/custom_drawer.dart';

import '../blocs/internet_bloc/internet_state.dart';

class InternetCheckScreen extends StatelessWidget {
  const InternetCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Internet Checker",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body:
          BlocConsumer<InternetBloc, InternetState>(listener: (context, state) {
        if (state is InternetConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Internet  Connected",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ));
        } else if (state is InternetDisconnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Internet Not Connected",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ));
        }
      }, builder: (context, state) {
        if (state is InternetConnectedState) {
          return const Center(
            child: Text(
              "Internet Connected",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          );
        } else if (state is InternetDisconnectedState) {
          return const Center(
            child: Text(
              "Internet Not Connected",
              style: TextStyle(
                  color: Colors.red, fontSize: 22, fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return const Center(
            child: Text(
              "Loading....",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          );
        }
      }),

      // BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
      //   if (state is InternetConnectedState) {
      //     return const Center(
      //       child: Text(
      //         "Internet Connected",
      //         style: TextStyle(
      //             color: Colors.green,
      //             fontSize: 22,
      //             fontWeight: FontWeight.w500),
      //       ),
      //     );
      //   } else if (state is InternetDisconnectedState) {
      //     return const Center(
      //       child: Text(
      //         "Internet Not Connected",
      //         style: TextStyle(
      //             color: Colors.red, fontSize: 22, fontWeight: FontWeight.w500),
      //       ),
      //     );
      //   } else {
      //     return const Center(
      //       child: Text(
      //         "Loading....",
      //         style: TextStyle(
      //             color: Colors.grey,
      //             fontSize: 22,
      //             fontWeight: FontWeight.w500),
      //       ),
      //     );
      //   }
      // }),
      //
    );
  }
}
