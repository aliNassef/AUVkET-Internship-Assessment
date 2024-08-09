import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/DI/dependency_injection.dart';
import '../../../home/presentation/view_model/get_all_product/get_all_products_cubit.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const String routeName = '/products_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<GetAllProductsCubit>()..getAllProducts(),
        // create: getIt<GetAllProductsCubit>()..getAllProducts(),
        child: const SafeArea(
          child: ProductsViewBody(),
        ),
      ),
    );
  }
}
