import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../login/presentation/views/login_view.dart';

class RowIndicator extends StatefulWidget {
  const RowIndicator({
    super.key,
    this.onTap,
    required this.pageController,
  });
  final PageController pageController;
  final VoidCallback? onTap;

  @override
  State<RowIndicator> createState() => _RowIndicatorState();
}

class _RowIndicatorState extends State<RowIndicator> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      currentPage = widget.pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DotsIndicator(
          dotsCount: 3,
          position: currentPage,
          decorator: DotsDecorator(
            size: const Size(16.0, 6.0),
            activeSize: const Size(16.0, 6.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: const Color(0xff6C63FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            activeColor: const Color(0xff2F2E41),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.pageController.page!.round() == 2) {
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            }
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff252525),
            ),
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
