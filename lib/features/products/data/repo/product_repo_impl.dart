import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intern_task/core/api/api_consumer.dart';
import 'package:intern_task/core/api/end_ponits.dart';
import 'package:intern_task/core/errors/exceptions.dart';

import 'package:intern_task/features/home/data/model/product_model/product_model.dart';

import 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ApiConsumer api;

  ProductRepoImpl({required this.api});
  @override
  Future<Either<ProductModel, String>> getAllProducts() async {
    log('message');
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
