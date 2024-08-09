import 'package:dartz/dartz.dart';
import '../model/category_model.dart';
import '../model/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<List<CategoreyModel>, String>> getCategory();
  Future<Either<ProductModel, String>> getAllProducts();
}
