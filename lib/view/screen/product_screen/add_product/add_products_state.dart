import 'package:demo_bloc_crud/model/add_product_model.dart';

abstract class AddProductsState {}

class AddProductsInitial extends AddProductsState {}

class AddProductsLoadingState extends AddProductsState {}

class AddProductsLoadedState extends AddProductsState {
  final AddProductModel addProductModel;

  AddProductsLoadedState(this.addProductModel);
}

class AddProductErrorState extends AddProductsState {
  String error;

  AddProductErrorState(this.error);
}
