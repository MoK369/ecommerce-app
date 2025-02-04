import 'package:ecommerce/data/models/sign_up_params/sign_up_params_data_model.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/authentication/authentication_data_model.dart';
import 'package:ecommerce/domain/use_cases/sign_up/sign_up_use_case.dart';
import 'package:ecommerce/presentation/modules/authentication/manager/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  SignUpUseCase signUpUseCase;
  SignUpViewModel({required this.signUpUseCase}) : super(SignUpLoadingState());

  void signUp({required SignUpParamsDataModel signUpParams}) async {
    emit(SignUpLoadingState());
    var useCaseResult = await signUpUseCase.invoke(signUpParams: signUpParams);
    switch (useCaseResult) {
      case Success<AuthenticationDataModel>():
        emit(SignUpSuccessState());
      case ServerError<AuthenticationDataModel>():
        emit(SignUpErrorState(exception: useCaseResult.serverErrorException));
      case CodeError<AuthenticationDataModel>():
        emit(SignUpErrorState(exception: useCaseResult.exception));
    }
  }
}
