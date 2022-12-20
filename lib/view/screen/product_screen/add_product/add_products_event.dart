abstract class AddProductsEvent {}

class InitialEvent extends AddProductsEvent {}

class AddProductDataEvent extends AddProductsEvent {
  final String? name;
  final String? mrp;
  final String? selling;
  final String? description;

  AddProductDataEvent(this.name, this.mrp, this.selling, this.description);
}
