import 'package:bloc/bloc.dart';
import 'package:demo_bloc_crud/model/profile_model.dart';
import 'package:demo_bloc_crud/services/profile_service.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_bloc/profile_event.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileModel? profileModel;
  ProfileService profileService;

  ProfileBloc(this.profileService) : super(ProfileLoadingState()) {
    on<ProfileDataEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        profileModel = await profileService.profile();
        print(profileModel!.user?.name);
        emit(ProfileLoadedState(profileModel!));
      } catch (e) {
        emit(ProfileErrorState(e.toString()));
      }
    });
  }
}
