import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/api_bloc/api_bloc.dart';
import 'package:flutter_bloc_demo/blocs/api_bloc/api_events.dart';
import 'package:flutter_bloc_demo/blocs/api_bloc/api_states.dart';

import '../data/models/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Users",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.teal,
        child: const Text(
          'Fetch\nUsers',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          context.read<ApiBloc>().add(ApiDataEvents());
        },
      ),
      body: Expanded(
        child: BlocBuilder<ApiBloc, ApiStates>(
          builder: (context, state) {
            if (state is ApiInitialState) {
              return const Center(
                  child: Text('Press the button to fetch users'));
            } else if (state is ApiLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ApiDataState) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  User user = state.users[index];
                  return Card(
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    ),
                  );
                },
              );
            } else if (state is ApiErrorState) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
