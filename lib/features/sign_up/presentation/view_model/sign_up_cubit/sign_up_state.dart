class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoaded extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SignUpLoading extends SignUpState {}

final class SignUpAcceptTerms extends SignUpState {}
