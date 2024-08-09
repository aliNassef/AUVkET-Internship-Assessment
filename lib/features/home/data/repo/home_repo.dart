import 'package:dartz/dartz.dart';
import 'package:intern_task/features/home/data/model/category_model.dart';
import 'package:intern_task/features/home/data/model/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<List<CategoreyModel>, String>> getCategory();
  Future<Either<ProductModel, String>> getAllProducts();
}
