
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/core/utils/app_styles.dart';

import '../../../data/model/product_model/datum.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final Datum product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.images![0],
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          HorizatalSpacer(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title!.substring(0, 10),
                style: AppStyles.textStyle14RP.copyWith(
                  color: const Color(0xff06004F),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${product.price!}\$',
                style: AppStyles.textStyle14RP.copyWith(
                  color: const Color(0xff06004F),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '(${product.ratingsAverage})',
              ),
              Icon(Icons.star, color: Colors.yellow, size: 16.sp),
            ],
          )
        ],
      ),
    );
  }
}
/*

*/