import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({super.key, required this.text, this.onPressed,  this.padding = 30});
  final String text;
  final void Function()? onPressed;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 12)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.textStyle20SB.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
