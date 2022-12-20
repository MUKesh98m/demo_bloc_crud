import 'package:demo_bloc_crud/model/update_profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateLoadingState extends UpdateState {}

class UpdateLoadedState extends UpdateState {
  final UpdateProfileModel updateProfileModel;

  UpdateLoadedState(this.updateProfileModel);
}

class UpdateErrorState extends UpdateState {}
