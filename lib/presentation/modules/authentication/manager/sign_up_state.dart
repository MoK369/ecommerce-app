sealed class SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  Exception exception;
  SignUpErrorState({required this.exception});
}
