import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/DI/dependency_injection.dart';
import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  bool rememberMe = false;
  rememberMeLogin() {
    rememberMe = !rememberMe;
    if (rememberMe == true) {
      getIt
          .get<CacheHelper>()
          .saveData(key: AppConstants.isLoggedIn, value: true);
    }
    emit(LoginRememberMe());
  }

  Future<void> login() async {
    emit(LoginLoading());
    final response = await _loginRepo.signIn(
      email: signInEmail.text,
      pass: signInPassword.text,
    );
    response.fold(
      (l) {
        getIt.get<CacheHelper>().saveData(key: ApiKey.token, value: l.token);
        emit(LoginLoaded());
      },
      (r) => emit(LoginFailure(errMessage: r)),
    );
  }
}
