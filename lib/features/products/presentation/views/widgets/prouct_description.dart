
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_styles.dart';
import 'package:intern_task/features/home/data/model/product_model/datum.dart';
import 'package:readmore/readmore.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.productDetails,
  });

  final Datum productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Description',
            style: AppStyles.textStyle18MP.copyWith(
              color: const Color(0xff06004F),
            ),
          ),
          ReadMoreText(
            productDetails.description!,
            trimLines: 2,
            style: AppStyles.textStyle14LP.copyWith(
              color: const Color(0xff06004F).withOpacity(0.6),
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
            ),
            trimLength: 300,
            colorClickableText: const Color(0xff06004F),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read More',
            trimExpandedText: ' less',
            moreStyle: AppStyles.textStyle14LP.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff06004F),
            ),
          ),
        ],
      ),
    );
  }
}

