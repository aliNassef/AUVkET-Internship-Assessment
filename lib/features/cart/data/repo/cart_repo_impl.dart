import 'package:dartz/dartz.dart';
import 'package:intern_task/core/errors/exceptions.dart';
import 'package:intern_task/features/cart/data/models/cart_model.dart';
import 'package:intern_task/features/cart/data/repo/cart_repo.dart';
  
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
 
class CartRepoImpl extends CartRepo {
  final ApiConsumer api;
  CartRepoImpl({required this.api});

  @override
  Future<String> addProductToCart({required String id}) async {
    try {
      final response = await api.post(
        EndPoints.getUserCart,
        data: {
          ApiKey.productId: id,
        },
      );

      return response.toString();
    } on ServerException catch (e) {
      return e.errModel.message!;
    }
  }

  @override
  Future<Either<CartModel, String>> getCartProducts() async {
    try {
      final response = await api.get(
        EndPoints.getUserCart,
      );
      var data = CartModel.fromJson(response);
      return Left(data);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<Either<CartModel, String>> removeSpecificCartItem(
      {required String id}) async {
    try {
      final response = await api.delete('${EndPoints.getUserCart}/$id');
      var cartModel = CartModel.fromJson(response);
      return Left(cartModel);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<Either<CartModel, String>> updateCartProductQuantity(
      {required int count, required String id}) async {
    try {
      final response = await api.patch('${EndPoints.getUserCart}/$id', data: {
        ApiKey.count: count,
      });
      var data = CartModel.fromJson(response);
      return Left(data);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
