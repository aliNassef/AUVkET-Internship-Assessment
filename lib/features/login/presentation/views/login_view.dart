import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/core/DI/dependency_injection.dart';
import 'package:intern_task/features/login/data/repo/login_repo_impl.dart';
import 'package:intern_task/features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:intern_task/features/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          getIt.get<LoginRepoImpl>(),
        ),
        child: const SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
