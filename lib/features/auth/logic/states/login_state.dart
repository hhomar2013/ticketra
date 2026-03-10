abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String token;
  LoginSuccessState(this.token);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
