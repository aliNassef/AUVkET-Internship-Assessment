import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/constants.dart';
import 'package:intern_task/core/DI/dependency_injection.dart';
import 'package:intern_task/core/cache/cache_helper.dart';
import 'package:intern_task/core/utils/app_colors.dart';
import 'package:intern_task/core/utils/app_images.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/core/utils/app_styles.dart';
import 'package:intern_task/features/home/presentation/views/home_view.dart';
import 'package:intern_task/features/onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    executeNav();
  }

  void executeNav() {
    if (getIt.get<CacheHelper>().containsKey(key: AppConstants.isLoggedIn) &&
        getIt.get<CacheHelper>().getData(key: AppConstants.isLoggedIn)) {
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(
          HomeView.routeName,
        ),
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(
          OnboardingView.routeName,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.splashImage,
            width: 200.w,
            height: 200.h,
          ),
          const VerticlaSpacer(15),
          Text(
            'Explora',
            style: AppStyles.textStyle30B.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
