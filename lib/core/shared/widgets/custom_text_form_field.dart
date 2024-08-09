import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.showIcon = false,
    this.controller,
    this.centerHint = false,
    this.validator,
    this.icon,
    this.initialValue,
    this.onSaved,
    this.readOnly = false,
    this.secure = false,
  });
  final String hintText;
  final bool showIcon;
  final bool centerHint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? icon;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final bool readOnly;
  final bool secure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: TextFormField(
        obscureText: secure,
        readOnly: readOnly,
        onSaved: onSaved,
        initialValue: initialValue,
        textAlign: centerHint ? TextAlign.center : TextAlign.start,
        controller: controller,
        validator: validator,
        // style: AppStyles.textStyle16SB.copyWith(
        //   color: AppColors.gray950,
        // ),
        //cursorColor: AppColors.gray400,
        autocorrect: true,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          hintText: hintText,
          hintStyle: AppStyles.textStyle14L.copyWith(
            color: Colors.black.withOpacity(0.5),
          ),

          filled: true,
          fillColor: const Color(0xffC4C4C4).withOpacity(0.2), //#E6E9EA
          border: borderStyle(),
          enabledBorder: borderStyle(),
          focusedBorder: borderStyle(),
          suffixIcon: showIcon
              ? Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: icon,
                )
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xffE6E9EA),
      ),
    );
  }
}
