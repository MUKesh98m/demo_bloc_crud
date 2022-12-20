import 'package:bloc/bloc.dart';
import 'package:demo_bloc_crud/model/add_product_model.dart';
import 'package:demo_bloc_crud/services/add_product_service.dart';
import 'package:demo_bloc_crud/widget/toast.dart';
import 'add_products_event.dart';
import 'add_products_state.dart';

class AddProductsBloc extends Bloc<AddProductsEvent, AddProductsState> {
  AddProductModel? addProductModel;
  AddProductService addProductService;

  AddProductsBloc(this.addProductService) : super(AddProductsInitial()) {
    on<AddProductsEvent>((event, emit) async {
      if (event is AddProductDataEvent) {
        emit(AddProductsLoadingState());
        addProductModel = await addProductService.AddProduct(
            name: event.name,
            mrp: event.mrp,
            description: event.description,
            selling: event.selling);
        print(addProductModel!.data?.mrp);
        if (addProductModel?.status == true) {
          Toast().showToast(addProductModel?.message.toString());
          emit(AddProductsLoadedState(addProductModel!));
        } else {
          Toast().errorToast(addProductModel?.message.toString());
        }
      }
    });
  }
}
