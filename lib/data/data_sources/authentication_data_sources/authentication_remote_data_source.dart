import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/data/models/sign_up_params/sign_up_params_data_model.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<ApiResult<AuthenticationDataModel>> signIn(
      {required SignInParamsDataModel signInParams});

  Future<ApiResult<AuthenticationDataModel>> signUp(
      {required SignUpParamsDataModel signUpParams});
}
