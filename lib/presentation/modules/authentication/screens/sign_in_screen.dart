import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/di.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/validate_functions/validate_functions.dart';
import 'package:ecommerce/presentation/core/widgets/error_state_widget.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/authentication/manager/sign_in_state.dart';
import 'package:ecommerce/presentation/modules/authentication/manager/sign_in_view_model.dart';
import 'package:ecommerce/presentation/modules/authentication/widgets/custom_text_field_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseViewStatefulWidget<SignInScreen> {
  final TextEditingController emailFieldController = TextEditingController(),
      passwordFieldController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignInViewModel signInViewModel = getIt.get<SignInViewModel>();
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    // print((237.w) / 237);
    // print((71.1.h) / 71.1);
    return BlocProvider(
      create: (context) => signInViewModel,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocListener<SignInViewModel, SignInState>(
          listener: (context, signInState) {
            switch (signInState) {
              case SignInLoadingState():
                showAlertDialog(
                    titleWidget: const LoadingStateWidget(
                  loadingMessage: "Loading",
                ));
              case SignInSuccessState():
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context,
                    DefinedRoutes.homeScreenRouteName, (route) => false,
                    arguments: signInState.authenticationDataModel);
              case SignInErrorState():
                Navigator.pop(context);
                showAlertDialog(
                  showOkButton: true,
                    titleWidget:
                        ErrorStateWidget(exception: signInState.exception));
            }
          },
          child: Scaffold(
            backgroundColor: AppThemes.lightOnPrimaryColor,
            body: SingleChildScrollView(
              child: RPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RPadding(
                      padding: const EdgeInsets.only(top: 91, bottom: 86),
                      child: SizedBox(
                        width: 237.w,
                        height: 71.1.h,
                        child: Center(
                          child: Image.asset(
                            "assets/icons/app_logo_icon.png",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Welcome Back To Route",
                      style:
                          theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
                    ),
                    Text(
                      "Please sign in with your mail",
                      style:
                          theme.textTheme.labelSmall!.copyWith(fontSize: 16.sp),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFieldBlock(
                            textFieldController: emailFieldController,
                            topPadding: 40,
                            labelText: "Email",
                            hintText: "enter your email",
                            keyboardType: TextInputType.name,
                            validatorFunc: (inputText) {
                              return ValidateFunctions.validationOfEmail(
                                  context, inputText);
                            },
                          ),
                          CustomTextFieldBlock(
                            textFieldController: passwordFieldController,
                            labelText: "Password",
                            hintText: "enter your password",
                            showPasswordVisibilityButton: true,
                            validatorFunc: (inputText) {
                              return ValidateFunctions.validationOfPassword(
                                  context, inputText);
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Text(
                              textAlign: TextAlign.end,
                              "Forgot password",
                              style: theme.textTheme.labelMedium!
                                  .copyWith(fontSize: 18.sp),
                            ),
                          ),
                          RPadding(
                            padding: const EdgeInsets.only(top: 56, bottom: 32),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    surfaceTintColor: Colors.transparent,
                                    backgroundColor: Colors.white,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.r)),
                                onPressed: () {
                                  onLoginClick();
                                },
                                child: Text(
                                  "Login",
                                  style: theme.textTheme.labelLarge!.copyWith(
                                      fontSize: 20.sp,
                                      color: AppThemes.lightOnPrimaryColor),
                                )),
                          ),
                          InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DefinedRoutes.signUpScreenRouteName);
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              "Don’t have an account? Create Account",
                              style: theme.textTheme.labelMedium!
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLoginClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate() == true) {
      signInViewModel.signIn(SignInParamsDataModel(
          email: emailFieldController.text,
          password: passwordFieldController.text));
    }
  }
}
