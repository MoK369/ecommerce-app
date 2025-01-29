import 'package:ecommerce/data/data_sources/authentication_data_sources/authentication_remote_data_source.dart';
import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/domain/repositories/authentication/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRemoteDataSource authenticationRemoteDataSource;
  AuthenticationRepositoryImp({required this.authenticationRemoteDataSource});
  @override
  Future<ApiResult<AuthenticationDataModel>> signIn(
      {required SignInParamsDataModel signInParams}) {
    return authenticationRemoteDataSource.signIn(signInParams: signInParams);
  }
}
