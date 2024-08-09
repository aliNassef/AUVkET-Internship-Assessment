import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_task/core/utils/app_colors.dart';
import 'package:intern_task/core/utils/app_images.dart';
import 'package:intern_task/core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.readOnly = false,
    this.searchControler,
    this.onSaved,
  });
  final bool readOnly;
  final TextEditingController? searchControler;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffF9F9F9),
            blurRadius: 8,
            spreadRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        onFieldSubmitted: onSaved,
        controller: searchControler,
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              AppImages.searchIcon,
              height: 20.h,
              width: 20.w,
              colorFilter: ColorFilter.mode(
                AppColors.mainColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          hintText: 'what do you search for?',
          hintStyle:
              AppStyles.textStyle14LP.copyWith(color: AppColors.secondaryColor),
          border: buildBorderStyle(),
          enabledBorder: buildBorderStyle(),
          focusedBorder: buildBorderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
