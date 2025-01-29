import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';

sealed class SignInState{}

class SignInLoadingState extends SignInState{}
class SignInSuccessState extends SignInState{
  AuthenticationDataModel authenticationDataModel;
  SignInSuccessState({required this.authenticationDataModel});
}
class SignInErrorState extends SignInState{
  Exception exception;
  SignInErrorState({required this.exception});
}