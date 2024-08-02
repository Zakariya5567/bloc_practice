import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/blocs/api_bloc/api_events.dart';
import 'package:flutter_bloc_demo/blocs/api_bloc/api_states.dart';

import '../../data/repo/user_repo.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  final UserRepository userRepository;

  ApiBloc(this.userRepository) : super(ApiInitialState()) {
    on<ApiDataEvents>(onFetchUsers);
  }

  void onFetchUsers(ApiDataEvents event, Emitter<ApiStates> emit) async {
    try {
      emit(ApiLoadingState());
      final users = await userRepository.fetchUsers();
      emit(ApiDataState(users));
    } catch (e) {
      emit(ApiErrorState('Failed to fetch users'));
    }
  }
}
