import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc_crud/model/product_list_model.dart';
import 'package:demo_bloc_crud/services/product_service.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/Product_list/product_event.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/Product_list/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductListModel? productListModel;
  ProductService productService;
  int page = 0;
  bool isFetching = false;

  ProductBloc(this.productService) : super(ProductLoadingState()) {
    on<ProductDataEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        page++;
        var productListModel = await productService.ProductList(page: page);
        print(productListModel!.data!.data?.first.name);
        emit(ProductLoadedState(productListModel));
      } catch (e) {
        emit(ProductErrorState("Error"));
      }
    });
  }
}
