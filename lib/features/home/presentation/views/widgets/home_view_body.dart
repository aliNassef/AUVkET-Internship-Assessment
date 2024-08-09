import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_spacer.dart';
import 'best_seller_header.dart';
import 'best_seller_products.dart';
import 'categories_header.dart';
import 'categories_horizantal_list.dart';
import '../../../../../core/utils/app_styles.dart';
import 'offers_horizantal_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
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
        ),
        const SliverToBoxAdapter(
          child: OffersHorizantalList(),
        ),
        const SliverToBoxAdapter(
          child: VerticlaSpacer(16),
        ),
        const SliverToBoxAdapter(
          child: CategoriesHeader(),
        ),
        const SliverToBoxAdapter(
          child: VerticlaSpacer(16),
        ),
        const SliverToBoxAdapter(
          child: CategoriesHorizanalList(),
        ),
        const SliverToBoxAdapter(
          child: BestSellerHeader(),
        ),
        const SliverToBoxAdapter(
          child: VerticlaSpacer(16),
        ),
        const SliverFillRemaining(
          child: BestSellerProducts(),
        ),
      ],
    );
  }
}
