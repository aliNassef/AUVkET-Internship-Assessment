
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../home/data/model/product_model/datum.dart';
 
class TitleAndPriceRow extends StatelessWidget {
  const TitleAndPriceRow({
    super.key,
    required this.productDetails,
  });

  final Datum productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              productDetails.title!,
              style: AppStyles.textStyle18SBP.copyWith(
                color: const Color(0xff06004F),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            '\$ ${productDetails.price}',
            style: AppStyles.textStyle13LP.copyWith(
              color: const Color(0xff06004F),
            ),
          ),
        ],
      ),
    );
  }
}
