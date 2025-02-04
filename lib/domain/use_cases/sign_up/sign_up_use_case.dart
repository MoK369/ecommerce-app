import 'package:ecommerce/data/models/sign_up_params/sign_up_params_data_model.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/domain/repositories/authentication/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  AuthenticationRepository authenticationRepository;
  SignUpUseCase({required this.authenticationRepository});

  Future<ApiResult<AuthenticationDataModel>> invoke(
      {required SignUpParamsDataModel signUpParams}) {
    return authenticationRepository.signUp(signUpParams: signUpParams);
  }
}
