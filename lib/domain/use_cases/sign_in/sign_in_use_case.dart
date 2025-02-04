import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/domain/repositories/authentication/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  AuthenticationRepository authenticationRepository;
  SignInUseCase({required this.authenticationRepository});

  Future<ApiResult<AuthenticationDataModel>> invoke(
      SignInParamsDataModel signInParams) {
    return authenticationRepository.signIn(signInParams: signInParams);
  }
}
