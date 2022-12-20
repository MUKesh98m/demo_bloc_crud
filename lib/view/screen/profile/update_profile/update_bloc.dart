import 'package:bloc/bloc.dart';
import 'package:demo_bloc_crud/model/update_profile_model.dart';
import 'package:demo_bloc_crud/services/update_service.dart';
import 'package:demo_bloc_crud/view/screen/profile/update_profile/update_event.dart';
import 'package:demo_bloc_crud/view/screen/profile/update_profile/update_state.dart';
import 'package:demo_bloc_crud/widget/toast.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateProfileModel? updateProfileModel;
  UpdateService updateService;

  UpdateBloc(this.updateService) : super(UpdateInitial()) {
    on<UpdateEvent>((event, emit) async {
      if (event is UpdateDataEvent) {
        emit(UpdateLoadingState());
        await Future.delayed(
          Duration(seconds: 3),
          () async {
            updateProfileModel = await updateService.userUpdate(
                email: event.email,
                name: event.name,
                birth_date: event.birthdate,
                id: event.id);
            if (updateProfileModel?.status == true) {
              Toast().showToast(updateProfileModel!.message.toString());
              emit(UpdateLoadedState(updateProfileModel!));
            } else {
              Toast().showToast(updateProfileModel!.message.toString());
            }
          },
        );
      }
    });
  }
}
