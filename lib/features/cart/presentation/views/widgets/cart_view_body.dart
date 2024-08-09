import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../core/utils/app_spacer.dart';
import '../../view_model/cart_cubit/cart_cubit.dart';
import '../../view_model/cart_cubit/cart_state.dart';
import 'cart_item.dart';
 
 import 'cart_shimmer_loading.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final cartProdduct = state.cartModel;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartItem(
                      product: cartProdduct.data!.products![index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const VerticlaSpacer(8);
                  },
                  itemCount: cartProdduct.numOfCartItems!,
                ),
              ),
              DefaultAppButton(
                padding: 16.w,
                text: 'pay ${context.read<CartCubit>().total}\$',
                onPressed: () {},
              ),
              const VerticlaSpacer(30),
            ],
          );
        } else if (state is CartFailure) {
          return Text(state.errMessage);
        } else {
          return const CartShimmerLoading();
        }
      },
    );
  }
}
