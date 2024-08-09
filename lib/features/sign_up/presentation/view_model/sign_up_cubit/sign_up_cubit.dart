import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:intern_task/features/sign_up/presentation/view_model/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());
  final SignUpRepo _signUpRepo;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  bool acceptTerms = false;
  acceptTermsChanged() {
    acceptTerms = !acceptTerms;
    emit(SignUpAcceptTerms());
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await _signUpRepo.signUp(
      name: signUpName.text,
      pass: signUpPassword.text,
      email: signUpEmail.text,
      phone: signUpPhone.text,
    );
    response.fold(
      (l) => emit(SignUpLoaded()),
      (r) => emit(
        SignUpFailure(
          errMessage: r,
        ),
      ),
    );
  }
}
