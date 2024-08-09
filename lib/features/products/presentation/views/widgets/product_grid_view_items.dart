import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/features/home/presentation/view_model/get_all_product/get_all_products_cubit.dart';
import 'package:intern_task/features/home/presentation/view_model/get_all_product/get_all_products_state.dart';
import 'package:intern_task/features/products/presentation/views/widgets/product_grid_item.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridViewItems extends StatelessWidget {
  const ProductGridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsLoaded) {
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: state.data.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => ProductGridItem(
                product: state.data.data![index],
              ),
            ),
          );
        } else if (state is GetAllProductsFailure) {
          return Text(state.errMessage);
        } else {
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.grey[300]!,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 150.h,
                          width: MediaQuery.sizeOf(context).width,
                          color: Colors.grey[300],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  color: Colors.grey[300],
                                ),
                                const VerticlaSpacer(8),
                                Container(
                                  height: 20,
                                  width: 50, // Adjust size as needed
                                  color: Colors.grey[
                                      300], // Placeholder for the price text
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: CircleAvatar(
                              backgroundColor: Colors
                                  .grey[300], // Placeholder for the button
                              radius: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
