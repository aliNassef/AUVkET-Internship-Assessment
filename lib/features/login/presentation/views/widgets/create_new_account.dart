import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../sign_up/presentation/views/sign_up_view.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'New Member?',
                style: AppStyles.textStyle13M.copyWith(
                  color: const Color(0xFF252525),
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignUpView.routeName);
                  },
                text: 'Register now',
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
