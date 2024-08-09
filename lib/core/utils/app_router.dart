import 'package:flutter/material.dart';
import 'package:intern_task/features/cart/presentation/views/cart_view.dart';
import 'package:intern_task/features/home/presentation/views/home_view.dart';
import 'package:intern_task/features/login/presentation/views/login_view.dart';
import 'package:intern_task/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:intern_task/features/products/presentation/views/products_view.dart';
import 'package:intern_task/features/sign_up/presentation/views/sign_up_view.dart';
import 'package:intern_task/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
    case OnboardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    case ProductsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductsView(),
      );
    case CartView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CartView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
