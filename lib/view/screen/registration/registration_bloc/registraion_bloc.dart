import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc_crud/model/registration_model.dart';
import 'package:demo_bloc_crud/services/registration_service.dart';
import 'package:demo_bloc_crud/view/screen/registration/registration_bloc/registraion_event.dart';
import 'package:demo_bloc_crud/view/screen/registration/registration_bloc/registraion_state.dart';
import 'package:demo_bloc_crud/widget/toast.dart';

class RegistraionBloc extends Bloc<RegistraionEvent, RegistraionState> {
  RegistrationModel? registrationModel;
  RegisterService registerService;

  RegistraionBloc(this.registerService) : super(RegistraionInitialState()) {
    on<RegistraionEvent>((event, emit) async {
      if (event is RegisterDataEvent) {
        emit(RegistrationLoadingState());
        await Future.delayed(
          Duration(seconds: 3),
          () async {
            registrationModel = await registerService.userRegister(
                name: event.name,
                email: event.email,
                password: event.password,
                file: event.file,
                password_confirmation: event.password_confirmation,
                birth_date: event.birth_date,
                gender: event.gender);
            if (registrationModel!.status == true) {
              Toast().showToast(registrationModel?.message.toString());
              emit(RegistrationLoadedState(registrationModel!));
            } else {
              Toast().showToast(registrationModel?.message.toString());
            }
          },
        );
      }
    });
  }
}
