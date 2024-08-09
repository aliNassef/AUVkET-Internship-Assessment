import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/features/home/presentation/views/widgets/category_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../view_model/get_categories_cubit/get_categories_cubit.dart';
import '../../view_model/get_categories_cubit/get_categories_state.dart';

class CategoriesHorizanalList extends StatelessWidget {
  const CategoriesHorizanalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoaded) {
          return SizedBox(
            height: 120.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: state.categories[index],
                );
              },
            ),
          );
        } else if (state is GetCategoriesFailure) {
          return Text(state.errMessage);
        } else {
          return SizedBox(
            height: 120.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      const VerticlaSpacer(8),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: 80, // Adjust width according to your design
                          height: 16, // Adjust height according to your design
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
