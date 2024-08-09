import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/core/DI/dependency_injection.dart';
import 'package:intern_task/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:intern_task/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => getIt.get<CartCubit>()..getCart(),
        child: const SafeArea(
          child: CartViewBody(),
        ),
      ),
    );
  }
}
