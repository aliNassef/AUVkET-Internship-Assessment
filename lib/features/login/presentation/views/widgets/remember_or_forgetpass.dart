import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_model/login_cubit/login_cubit.dart';
import '../../view_model/login_cubit/login_state.dart';

class RemeberOrForgetPass extends StatelessWidget {
  const RemeberOrForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Row(
            children: [
              Transform.translate(
                offset: const Offset(-10, 0),
                child: Transform.scale(
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
                    value: loginCubit.rememberMe,
                    onChanged: (value) {
                      loginCubit.rememberMeLogin();
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-12, 0),
                child: Text(
                  'Remember me',
                  style: AppStyles.textStyle9R.copyWith(
                    color: const Color(0xff252525),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forget password ?',
                  style: AppStyles.textStyle9R
                      .copyWith(color: AppColors.mainColor),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
