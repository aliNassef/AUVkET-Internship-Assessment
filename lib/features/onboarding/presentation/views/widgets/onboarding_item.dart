import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/constants.dart';
import '../../../../../core/utils/app_spacer.dart';
import '../../../../../core/utils/app_styles.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppConstants.pageViewModels[index].image,
            width: double.infinity,
            height: 250.h,
          ),
          const VerticlaSpacer(60),
          Text(
            AppConstants.pageViewModels[index].title,
            style: AppStyles.textStyle30B.copyWith(
              color: const Color(0xff252525),
            ),
          ),
          Text(
            AppConstants.pageViewModels[index].description,
            style: AppStyles.textStyle24L.copyWith(
              color: const Color(0xff252525),
            ),
          ),
          const VerticlaSpacer(36),
        ],
      ),
    );
  }
}
