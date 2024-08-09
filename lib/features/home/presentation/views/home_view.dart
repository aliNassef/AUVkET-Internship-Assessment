import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/core/DI/dependency_injection.dart';
import 'package:intern_task/features/home/data/repo/home_repo_impl.dart';
import 'package:intern_task/features/home/presentation/view_model/get_all_product/get_all_products_cubit.dart';
import 'package:intern_task/features/home/presentation/view_model/get_categories_cubit/get_categories_cubit.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetCategoriesCubit(
              getIt.get<HomeRepoImpl>(),
            )..getCategories(),
          ),
          BlocProvider.value(
            value: getIt<GetAllProductsCubit>()..getAllProducts(),
          ),
        ],
        child: const SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
