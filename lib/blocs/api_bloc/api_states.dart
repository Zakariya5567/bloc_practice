import '../../data/models/user_model.dart';

abstract class ApiStates {}

class ApiInitialState extends ApiStates {}

class ApiLoadingState extends ApiStates {}

class ApiDataState extends ApiStates {
  final List<User> users;
  ApiDataState(this.users);
}

class ApiErrorState extends ApiStates {
  String message;
  ApiErrorState(this.message);
}
