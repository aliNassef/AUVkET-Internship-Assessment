import '../../../../home/data/model/product_model/product_model.dart';

class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final ProductModel productModel;

  ProductLoaded({required this.productModel});
}

final class ProductFailure extends ProductState {
  final String errMessage;

  ProductFailure({required this.errMessage});
}
