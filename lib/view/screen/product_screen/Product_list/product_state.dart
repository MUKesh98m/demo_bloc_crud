import 'package:demo_bloc_crud/model/product_list_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final ProductListModel productListModel;

  ProductLoadedState(this.productListModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
