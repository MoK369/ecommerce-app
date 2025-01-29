import 'package:ecommerce/data/data_sources/authentication_data_sources/authentication_remote_data_source.dart';
import 'package:ecommerce/data/models/authentication/authentication_data_model_dto.dart';
import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/data/services/apis/api_manager.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRemoteDataSource)
class AuthenticationRemoteDataSourceImp
    implements AuthenticationRemoteDataSource {
  ApiManager apiManager;
  AuthenticationRemoteDataSourceImp({required this.apiManager});

  @override
  Future<ApiResult<AuthenticationDataModel>> signIn(
      {required SignInParamsDataModel signInParams}) async {
    var apiResult = await apiManager.signIn(signInParams: signInParams);
    switch (apiResult) {
      case Success<AuthenticationDataModelDto>():
        var convertedResult = apiResult.data.convertToAuthenticationDataModel();
        return Success(data: convertedResult);
      case ServerError<AuthenticationDataModelDto>():
        return ServerError(
            serverErrorException: apiResult.serverErrorException);
      case CodeError<AuthenticationDataModelDto>():
        return CodeError(exception: apiResult.exception);
    }
  }
}
