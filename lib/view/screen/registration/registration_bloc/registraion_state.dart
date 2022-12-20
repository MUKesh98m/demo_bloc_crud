import 'package:demo_bloc_crud/model/registration_model.dart';

abstract class RegistraionState {}

class RegistraionInitialState extends RegistraionState {}

class RegistrationLoadingState extends RegistraionState {}

class RegistrationLoadedState extends RegistraionState {
  final RegistrationModel registrationModel;

  RegistrationLoadedState(this.registrationModel);
}

class RegistrationErrorState extends RegistraionState {}
