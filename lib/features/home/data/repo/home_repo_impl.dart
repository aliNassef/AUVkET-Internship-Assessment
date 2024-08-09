import 'dart:developer';

import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/category_model.dart';
import '../model/product_model/product_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});
  @override
  Future<Either<List<CategoreyModel>, String>> getCategory() async {
    try {
      final response = await api.get(EndPoints.getAllCategories);

      List<CategoreyModel> categories = [];
      for (var item in response[ApiKey.data]) {
        categories.add(CategoreyModel.fromJson(item));
      }
      return Left(categories);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<Either<ProductModel, String>> getAllProducts() async {
    try {
      final response = await api.get(EndPoints.getAllProducts);
      var data = ProductModel.fromJson(response);
      return Left(data);
    } on ServerException catch (e) {
      log('ServerException: ${e.errModel.message}');

      return Right(e.errModel.message!);
    }
  }
}
