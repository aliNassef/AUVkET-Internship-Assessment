import 'package:dartz/dartz.dart';
import '../models/cart_model.dart';

abstract class CartRepo {
  Future<Either<CartModel, String>> getCartProducts();
  Future<String> addProductToCart({required String id});
  Future<Either<CartModel, String>> removeSpecificCartItem(
      {required String id});
  Future<Either<CartModel, String>> updateCartProductQuantity(
      {required int count, required String id});
}
