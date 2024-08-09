import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoreyModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 2.w,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            // image not equal null sin api
            backgroundImage: NetworkImage(category.image!),
          ),
          Text(
            category.name!,
            style: AppStyles.textStyle14RP.copyWith(
              color: const Color(0xFF06004F),
            ),
          ),
        ],
      ),
    );
  }
}
