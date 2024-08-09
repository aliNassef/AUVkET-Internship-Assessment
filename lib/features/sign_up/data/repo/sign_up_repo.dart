import 'package:dartz/dartz.dart';

import '../model/sign_up_model/sign_up_model.dart';

abstract class SignUpRepo {
  Future<Either<SignUpModel, String>> signUp({
    required String name,
    required String pass,
    required String email,
    required String phone,
  });
}
