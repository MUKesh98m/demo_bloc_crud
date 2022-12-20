import 'package:demo_bloc_crud/model/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final ProfileModel profileModel;

  ProfileLoadedState(this.profileModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
