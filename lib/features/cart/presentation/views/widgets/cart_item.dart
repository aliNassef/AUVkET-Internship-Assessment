import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_styles.dart';
import 'package:intern_task/features/cart/data/models/product.dart';
import 'package:intern_task/features/cart/presentation/views/widgets/counter_row.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_spacer.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: AppColors.mainColor,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  product.product?.imageCover ??
                      'https://img.freepik.com/free-photo/painting-cat-with-gold-medallion-its-collar_1340-34150.jpg?t=st=1723156257~exp=1723159857~hmac=cc65b1c1262efd56f5aac4a81ffa10de24cc8978e7432cbb9ac5716a20e3cc04&w=360',
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.fill,
                ),
              ),
              const HorizatalSpacer(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product.product!.title!.substring(0, 5),
                    style: AppStyles.textStyle18MP.copyWith(
                      color: const Color(0xff06004F),
                    ),
                  ),
                  const VerticlaSpacer(8),
                  Text(
                    '${product.price}\$',
                    style: AppStyles.textStyle18MP.copyWith(
                      color: const Color(0xff06004F),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.delete_rounded,
                      color: AppColors.mainColor,
                      size: 26,
                    ),
                    const Spacer(),
                    const CounterRow()
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
