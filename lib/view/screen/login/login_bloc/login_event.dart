abstract class LoginEvent {}

class InitialEvent extends LoginEvent {}

class LoginDataEvent extends LoginEvent {
  final String? email;
  final String? password;

  LoginDataEvent(this.email, this.password);
}
