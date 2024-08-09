import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._homeRepo) : super(GetCategoriesInitial());
  final HomeRepo _homeRepo;

  getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _homeRepo.getCategory();
    result.fold((l) {
      emit(GetCategoriesLoaded(
        categories: l,
      ));
    }, (r) {
      emit(GetCategoriesFailure(
        errMessage: r,
      ));
    });
  }
}
