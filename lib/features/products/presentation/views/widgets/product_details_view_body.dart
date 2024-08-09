
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/shared/widgets/default_app_button.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/features/home/data/model/product_model/datum.dart';
import 'package:intern_task/features/products/presentation/views/widgets/carsousel_images.dart';
import 'package:intern_task/features/products/presentation/views/widgets/prouct_description.dart';
import 'package:intern_task/features/products/presentation/views/widgets/sold_and_ratig_row.dart';
import 'package:intern_task/features/products/presentation/views/widgets/title_and_price_row.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
    required this.productDetails,
  });

  final Datum productDetails;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarsouselImages(
            images: productDetails.images ?? [],
          ),
          const VerticlaSpacer(24),
          TitleAndPriceRow(productDetails: productDetails),
          const VerticlaSpacer(16),
          SoldAndRatingRow(productDetails: productDetails),
          const VerticlaSpacer(8),
          ProductDescription(productDetails: productDetails),
          const VerticlaSpacer(60),
          DefaultAppButton(
            text: 'Add To Cart',
            onPressed: () {},
            padding: 16.w,
          ),
        ],
      ),
    );
  }
}
