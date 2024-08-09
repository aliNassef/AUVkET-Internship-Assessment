import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginModel extends Equatable {
  final String? message;
  final User? user;
  final String? token;

  const LoginModel({this.message, this.user, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [message, user, token];
}
