import 'package:intern_task/features/home/data/model/category_model.dart';

class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoaded extends GetCategoriesState {
  final List<CategoreyModel> categories;

  GetCategoriesLoaded({required this.categories});
}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesFailure extends GetCategoriesState {
  final String errMessage;

  GetCategoriesFailure({required this.errMessage});
}
