import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../view_model/sign_up_cubit/sign_up_cubit.dart';
import '../../view_model/sign_up_cubit/sign_up_state.dart';

import '../../../../../core/utils/app_styles.dart';

class TermsAndCondation extends StatelessWidget {
  const TermsAndCondation({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  side: const BorderSide(color: Color(0xffCBCBCB)),
                  activeColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: const BorderSide(
                      color: Color(0xffCBCBCB),
                    ),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: signUpCubit.acceptTerms,
                  onChanged: (value) {
                    signUpCubit.acceptTermsChanged();
                  },
                ),
              );
            },
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'By checking the box you agree to our ',
                    style: AppStyles.textStyle9R.copyWith(
                      color: const Color(0xFF252525),
                    ),
                  ),
                  TextSpan(
                    text: 'Terms',
                    style: AppStyles.textStyle9R.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: AppStyles.textStyle9R.copyWith(
                      color: const Color(0xFF252525),
                    ),
                  ),
                  TextSpan(
                    text: 'Conditions',
                    style: AppStyles.textStyle9R.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: AppStyles.textStyle9R.copyWith(
                      color: const Color(0xFF252525),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
