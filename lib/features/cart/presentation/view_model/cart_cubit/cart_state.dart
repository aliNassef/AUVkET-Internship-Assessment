import 'package:intern_task/features/cart/data/models/cart_model.dart';

class CartState {}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final CartModel cartModel;

  CartLoaded({required this.cartModel});
}

final class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}

final class CartLoading extends CartState {}

final class CartAddedSuccess extends CartState {}

final class CartAddedFailure extends CartState {
  final String errMessage;

  CartAddedFailure({required this.errMessage});
}

final class CartAddLoading extends CartState {}
