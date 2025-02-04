import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/domain/use_cases/sign_in/sign_in_use_case.dart';
import 'package:ecommerce/presentation/core/storage/app_local_storage.dart';
import 'package:ecommerce/presentation/modules/authentication/manager/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  SignInUseCase signInUseCase;
  SignInViewModel({required this.signInUseCase}) : super(SignInLoadingState());

  void signIn(SignInParamsDataModel signInParams) async {
    emit(SignInLoadingState());
    var useCaseResult = await signInUseCase.invoke(signInParams);
    switch (useCaseResult) {
      case Success<AuthenticationDataModel>():
        AppLocalStorage.setUserInfo(useCaseResult.data);
        emit(SignInSuccessState(authenticationDataModel: useCaseResult.data));
      case ServerError<AuthenticationDataModel>():
        emit(SignInErrorState(exception: useCaseResult.serverErrorException));
      case CodeError<AuthenticationDataModel>():
        emit(SignInErrorState(exception: useCaseResult.exception));
    }
  }
}
