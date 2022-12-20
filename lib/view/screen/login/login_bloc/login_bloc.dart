import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc_crud/constant/app_preference.dart';
import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/login_model.dart';
import 'package:demo_bloc_crud/services/login_Service.dart';
import 'package:demo_bloc_crud/widget/toast.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginModel? loginModel;
  LoginService loginService;

  LoginBloc(this.loginService) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginDataEvent) {
        emit(LoginLoadingState());
        await Future.delayed(Duration(seconds: 3), (() async {
          loginModel = await loginService.userLogin(
              email: event.email, password: event.password);
          AppPreference.set(AppString.token, loginModel!.token);
          AppPreference.set(AppString.status, loginModel!.status);
          if (loginModel != null) {
            if (loginModel!.status == true) {
              Toast().showToast("Successfully Login");
            } else {
              Toast().errorToast("These credentials do not match our records");
            }
          } else {
            print('login model == null');
            Toast().errorToast("Record Not Match");
          }
          emit(LoginLoadedState(loginModel!));
        }));
      }
    });
  }
}
