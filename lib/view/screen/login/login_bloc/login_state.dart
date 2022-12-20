import 'package:demo_bloc_crud/model/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final LoginModel loginModel;

  LoginLoadedState(this.loginModel);
}

class LoginErrorState extends LoginState {}
