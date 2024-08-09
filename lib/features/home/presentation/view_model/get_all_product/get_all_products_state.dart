import 'package:intern_task/features/home/data/model/product_model/product_model.dart';

class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsLoaded extends GetAllProductsState {
  final ProductModel data;

  GetAllProductsLoaded({required this.data});
}

final class GetAllProductsFailure extends GetAllProductsState {
  final String errMessage;

  GetAllProductsFailure({required this.errMessage});
}
