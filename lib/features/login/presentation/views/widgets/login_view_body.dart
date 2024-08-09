import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/shared/functions/build_loading_box.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_spacer.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../view_model/login_cubit/login_cubit.dart';
import '../../view_model/login_cubit/login_state.dart';
import 'create_new_account.dart';
import 'remember_or_forgetpass.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errMessage),
              );
            },
          );
        } else if (state is LoginLoading) {
          buildLoadingBox(context);
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: loginCubit.signInFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VerticlaSpacer(30),
              SizedBox(
                height: 160.h,
                width: double.infinity,
                child:
                    Image.asset(AppImages.welcomeBackImage, fit: BoxFit.fill),
              ),
              const VerticlaSpacer(100),
              CustomTextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                controller: loginCubit.signInEmail,
                hintText: 'Enter your email',
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
                    return 'Please enter password';
                  }
                  return null;
                },
                controller: loginCubit.signInPassword,
                hintText: 'Password',
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
              const RemeberOrForgetPass(),
              const VerticlaSpacer(60),
              DefaultAppButton(
                text: 'Next',
                onPressed: () {
                  if (loginCubit.signInFormKey.currentState!.validate()) {
                    loginCubit.login();
                  }
                },
              ),
              const VerticlaSpacer(20),
              const CreateNewAccount(),
              const VerticlaSpacer(20),
            ],
          ),
        ),
      ),
    );
  }
}
