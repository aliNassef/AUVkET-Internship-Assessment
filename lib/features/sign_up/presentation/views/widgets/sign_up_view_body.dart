import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intern_task/core/shared/functions/build_loading_box.dart';
import 'package:intern_task/core/shared/functions/toast_dialog.dart';
import 'package:intern_task/core/shared/widgets/custom_text_form_field.dart';
import 'package:intern_task/core/shared/widgets/default_app_button.dart';
import 'package:intern_task/core/utils/app_images.dart';
import 'package:intern_task/core/utils/app_spacer.dart';
import 'package:intern_task/features/login/presentation/views/login_view.dart';
import 'package:intern_task/features/sign_up/presentation/view_model/sign_up_cubit/sign_up_state.dart';
import 'package:intern_task/features/sign_up/presentation/views/widgets/already_have_account.dart';
import 'package:intern_task/features/sign_up/presentation/views/widgets/terms_and_condations.dart';

import '../../view_model/sign_up_cubit/sign_up_cubit.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoaded) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else if (state is SignUpFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errMessage),
              );
            },
          );
        } else if (state is SignUpLoading) {
          buildLoadingBox(context);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: signUpCubit.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VerticlaSpacer(30),
              SizedBox(
                height: 160.h,
                width: double.infinity,
                child: Image.asset(AppImages.getStartedImage, fit: BoxFit.fill),
              ),
              const VerticlaSpacer(30),
              CustomTextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'please enter name';
                  }
                  return null;
                },
                controller: signUpCubit.signUpName,
                hintText: 'Full name',
                showIcon: true,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImages.userSvg,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              const VerticlaSpacer(20),
              CustomTextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'please enter email';
                  }
                  return null;
                },
                controller: signUpCubit.signUpEmail,
                hintText: 'Valid email',
                showIcon: true,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImages.mailSvg,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              const VerticlaSpacer(20),
              CustomTextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'please enter phone number';
                  }
                  return null;
                },
                controller: signUpCubit.signUpPhone,
                hintText: 'Phone number',
                showIcon: true,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImages.phoneSvg,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              const VerticlaSpacer(20),
              CustomTextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: signUpCubit.signUpPassword,
                hintText: 'Strong Password',
                showIcon: true,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppImages.lockSvg,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              const VerticlaSpacer(20),
              const TermsAndCondation(),
              const VerticlaSpacer(20),
              DefaultAppButton(
                text: 'Next',
                onPressed: () {
                  if (signUpCubit.signUpFormKey.currentState!.validate() &&
                      signUpCubit.acceptTerms) {
                    signUpCubit.signUp();
                  } else {
                    showToast(text: 'Please accept terms and conditions');
                  }
                },
              ),
              const VerticlaSpacer(20),
              const AlreaddyHaveAccount(),
              const VerticlaSpacer(20),
            ],
          ),
        ),
      ),
    );
  }
}
