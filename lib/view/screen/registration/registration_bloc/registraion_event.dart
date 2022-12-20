import 'dart:io';

abstract class RegistraionEvent {}

class InitialEvent extends RegistraionEvent {}

class RegisterDataEvent extends RegistraionEvent {
  final String? name;
  final String? email;
  final String? password;
  final String? file;
  final String? password_confirmation;
  final String? birth_date;
  final String? gender;

  RegisterDataEvent(
    this.name,
    this.email,
    this.password,
    this.file,
    this.password_confirmation,
    this.birth_date,
    this.gender,
  );
}
