import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/api_bloc/api_bloc.dart';
import 'package:flutter_bloc_demo/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_demo/data/repo/user_repo.dart';
import 'package:flutter_bloc_demo/screens/internet_check_screen.dart';

import 'blocs/colors_bloc/colors_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ColorsBloc()),
        BlocProvider(create: (context) => ApiBloc(UserRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InternetCheckScreen(),
      ),
    );
  }
}
