import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/product_repo.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(ProductInitial());
  final ProductRepo _productRepo;

  Future<void> getAllProducts() async {
    log('message');
    emit(ProductLoading());
    final result = await _productRepo.getAllProducts();
    result.fold(
      (l) => emit(
        ProductLoaded(productModel: l),
      ),
      (r) => emit(
        ProductFailure(errMessage: r),
      ),
    );
  }
}
