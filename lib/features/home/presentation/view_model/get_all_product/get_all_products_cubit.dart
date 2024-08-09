import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this._homeRepo) : super(GetAllProductsInitial());
  final HomeRepo _homeRepo;

  getAllProducts() async {
    log('getAllProducts called');

    emit(GetAllProductsLoading());
    var result = await _homeRepo.getAllProducts();
    result.fold(
      (l) => emit(GetAllProductsLoaded(data: l)),
      (r) => emit(GetAllProductsFailure(errMessage: r)),
    );
  }
}
