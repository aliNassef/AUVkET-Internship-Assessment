import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticlaSpacer extends StatelessWidget {
  const VerticlaSpacer(
    this.height, {
    super.key,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class HorizatalSpacer extends StatelessWidget {
  const HorizatalSpacer(
    this.width, {
    super.key,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
