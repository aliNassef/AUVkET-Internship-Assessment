import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import '../../../../../core/utils/app_spacer.dart';
import 'product_grid_view_Items.dart';
 
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explora',
                style: AppStyles.textStyle30B
                    .copyWith(color: AppColors.mainColor)
                    .copyWith(fontFamily: GoogleFonts.alata().fontFamily),
              ),
              const VerticlaSpacer(16),
              const CustomSearchBar(),
              const VerticlaSpacer(16),
            ],
          ),
        ),
        const ProductGridViewItems(),
      ],
    );
  }
}
