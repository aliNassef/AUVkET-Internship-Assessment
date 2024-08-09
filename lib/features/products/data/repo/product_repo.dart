import 'package:dartz/dartz.dart';
import '../../../home/data/model/product_model/product_model.dart';

abstract class ProductRepo {
  Future<Either<ProductModel, String>> getAllProducts();
}
