import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/sign_up_model/sign_up_model.dart';
import 'sign_up_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  final ApiConsumer api;

  SignUpRepoImpl({required this.api});
  @override
  Future<Either<SignUpModel, String>> signUp({
    required String name,
    required String pass,
    required String email,
    required String phone,
  }) async {
    try {
      var response = await api.post(
        EndPoints.userRegister,
        data: {
          ApiKey.email: email,
          ApiKey.name: name,
          ApiKey.password: pass,
          ApiKey.phone: phone,
        },
      );
      final user = SignUpModel.fromJson(response);
      return Left(user);
    } on ServerException catch (e) {
      return Right(e.errModel.errors?.msg ?? e.errModel.message!);
    }
  }
}
