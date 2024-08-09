import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../login/presentation/views/login_view.dart';

class AlreaddyHaveAccount extends StatelessWidget {
  const AlreaddyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Already a member?',
                style: AppStyles.textStyle13M.copyWith(
                  color: const Color(0xFF252525),
                ),
              ),
              const TextSpan(
                text: ' ',
                style: TextStyle(
                  color: Color(0xFF252525),
                  fontSize: 13,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                text: 'Log In',
                style: AppStyles.textStyle13SB.copyWith(
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
