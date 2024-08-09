import 'package:dartz/dartz.dart';
import '../model/login/login.dart';
import 'login_repo.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiConsumer api;

  LoginRepoImpl({required this.api});

  @override
  Future<Either<LoginModel, String>> signIn(
      {required String email, required String pass}) async {
    try {
      final response = await api.post(EndPoints.userLogin, data: {
        ApiKey.email: email,
        ApiKey.password: pass,
      });
      final user = LoginModel.fromJson(response);
      return Left(user);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
