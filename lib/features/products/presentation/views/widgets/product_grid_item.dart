import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_colors.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/core/utils/app_styles.dart';
import 'package:intern_task/features/home/data/model/product_model/datum.dart';
import 'package:intern_task/features/products/presentation/views/product_details_view.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    super.key,
    required this.product,
  });
  final Datum product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(product.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsView(productDetails: product)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            width: 1.5,
            color: AppColors.secondaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.images![0],
                height: 150.h,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              ),
            ),
            const VerticlaSpacer(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!.substring(0, 8),
                        style: AppStyles.textStyle13M.copyWith(
                          color: const Color(0xff06004F),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const VerticlaSpacer(8),
                      Text(
                        '${product.price}\$',
                        style: AppStyles.textStyle13M.copyWith(
                          color: const Color(0xff06004F),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 20,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
