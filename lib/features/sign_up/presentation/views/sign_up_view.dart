import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/DI/dependency_injection.dart';
import '../../data/repo/sign_up_repo_impl.dart';
import '../view_model/sign_up_cubit/sign_up_cubit.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/signUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<SignUpRepoImpl>()),
        child: const SafeArea(
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}
