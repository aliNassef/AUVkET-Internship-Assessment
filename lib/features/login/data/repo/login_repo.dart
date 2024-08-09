import 'package:dartz/dartz.dart';

import '../model/login/login.dart';

abstract class LoginRepo {
  Future<Either<LoginModel, String>> signIn({
    required String email,
    required String pass,
  });
}
