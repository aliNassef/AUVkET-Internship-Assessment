import 'package:flutter/material.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../home/presentation/views/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../../products/presentation/views/products_view.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const ProductsView(),
      const CartView(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: const Icon(Icons.home_outlined),
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.mainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.search),
        iconSize: 30,
        icon: const Icon(Icons.search),
        activeColorSecondary: AppColors.mainColor,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.card_travel),
        iconSize: 30,
        icon: const Icon(Icons.card_travel),
        activeColorSecondary: AppColors.mainColor,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.person_outline),
        iconSize: 30,
        activeColorSecondary: AppColors.mainColor,
        icon: const Icon(Icons.person_outline),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: buildNavBarDecoration(),
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property
    );
  }

  NavBarDecoration buildNavBarDecoration() {
    return NavBarDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 7,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
      colorBehindNavBar: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );
  }
}
