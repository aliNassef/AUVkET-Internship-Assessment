import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/core/utils/app_styles.dart';
import 'package:intern_task/features/home/data/model/product_model/datum.dart';

class SoldAndRatingRow extends StatelessWidget {
  const SoldAndRatingRow({
    super.key,
    required this.productDetails,
  });

  final Datum productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Container(
            width: 102.w,
            height: 34.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff004182),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '${productDetails.sold} Sold',
                style: AppStyles.textStyle14RP.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff004182),
                ),
              ),
            ),
          ),
          const HorizatalSpacer(16),
          const Icon(
            Icons.star,
            size: 15,
            color: Colors.yellow,
          ),
          Text(
            '${productDetails.ratingsAverage} (${productDetails.ratingsQuantity})',
            style: AppStyles.textStyle14RP.copyWith(
              color: const Color(0xff004182),
              fontWeight: FontWeight.w400,
            ),
          ),
          const HorizatalSpacer(47),
        ],
      ),
    );
  }
}
