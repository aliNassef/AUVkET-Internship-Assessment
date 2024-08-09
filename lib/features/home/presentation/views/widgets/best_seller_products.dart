import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_spacer.dart';
import '../../view_model/get_all_product/get_all_products_state.dart';
import 'product_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../view_model/get_all_product/get_all_products_cubit.dart';

class BestSellerProducts extends StatelessWidget {
  const BestSellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductItem(
                product: state.data.data![index],
              );
            },
            separatorBuilder: (context, index) {
              return const VerticlaSpacer(8);
            },
            itemCount: 10,
          );
        } else if (state is GetAllProductsFailure) {
          return Text(state.errMessage);
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 100.h,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                HorizatalSpacer(16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 60,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
      },
    );
  }
}
