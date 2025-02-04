import 'package:ecommerce/data/models/sign_up_params/sign_up_params_data_model.dart';
import 'package:ecommerce/di.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/validate_functions/validate_functions.dart';
import 'package:ecommerce/presentation/core/widgets/error_state_widget.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/authentication/manager/sign_up_state.dart';
import 'package:ecommerce/presentation/modules/authentication/manager/sign_up_view_model.dart';
import 'package:ecommerce/presentation/modules/authentication/widgets/custom_text_field_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseViewStatefulWidget<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUpViewModel signUpViewModel = getIt.get<SignUpViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpViewModel,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocListener<SignUpViewModel, SignUpState>(
          listener: (context, signUpstate) {
            switch (signUpstate) {
              case SignUpLoadingState():
                showAlertDialog(
                    titleWidget: const LoadingStateWidget(
                  loadingMessage: "Loading",
                ));
              case SignUpSuccessState():
                Navigator.pop(context);
                showAlertDialog(
                  showOkButton: true,
                    titleWidget: Text(
                  "Signed Up Successfully!",
                  style: theme.textTheme.labelMedium!.copyWith(
                      color: AppThemes.lightOnPrimaryColor, fontSize: 18.sp),
                ));
              case SignUpErrorState():
                Navigator.pop(context);
                showAlertDialog(
                  showOkButton: true,
                    titleWidget:
                        ErrorStateWidget(exception: signUpstate.exception));
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
                        padding: const EdgeInsets.only(top: 85, bottom: 46),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/app_logo_icon.png",
                            width: 237.w,
                            height: 71.1.h,
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextFieldBlock(
                              textFieldController: fullNameController,
                              topPadding: 0,
                              labelText: "Full Name",
                              hintText: "enter your full name",
                              keyboardType: TextInputType.name,
                              validatorFunc: (inputText) {
                                return ValidateFunctions.validationOfFullName(
                                    context, inputText);
                              },
                            ),
                            CustomTextFieldBlock(
                              textFieldController: phoneNumberController,
                              labelText: "Mobile Number",
                              hintText: "enter your mobile no.",
                              keyboardType: TextInputType.phone,
                              validatorFunc: (inputText) {
                                return ValidateFunctions
                                    .validationOfPhoneNumber(
                                        context, inputText);
                              },
                            ),
                            CustomTextFieldBlock(
                              textFieldController: emailController,
                              labelText: "E-mail address",
                              hintText: "enter your email address",
                              keyboardType: TextInputType.emailAddress,
                              validatorFunc: (inputText) {
                                return ValidateFunctions.validationOfEmail(
                                    context, inputText);
                              },
                            ),
                            CustomTextFieldBlock(
                              textFieldController: passwordController,
                              labelText: "Password",
                              hintText: "enter your password",
                              showPasswordVisibilityButton: true,
                              validatorFunc: (inputText) {
                                return ValidateFunctions.validationOfPassword(
                                    context, inputText);
                              },
                            ),
                            CustomTextFieldBlock(
                              textFieldController: rePasswordController,
                              labelText: "Confirm Password",
                              hintText: "enter your password again",
                              showPasswordVisibilityButton: true,
                              validatorFunc: (inputText) {
                                if (rePasswordController.text ==
                                    passwordController.text) {
                                  return null;
                                } else {
                                  return "No Match!";
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 56.r,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              surfaceTintColor: Colors.transparent,
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 20.r)),
                          onPressed: () {
                            onSignUpClick();
                          },
                          child: Text(
                            "Sign up",
                            style: theme.textTheme.labelLarge!.copyWith(
                                fontSize: 20.sp,
                                color: AppThemes.lightOnPrimaryColor),
                          )),
                      RPadding(
                        padding: const EdgeInsets.only(top: 56, bottom: 32),
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            "Have An Account? Log In",
                            style: theme.textTheme.labelMedium!
                                .copyWith(fontSize: 18.sp),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void onSignUpClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate() == true) {
      signUpViewModel.signUp(
          signUpParams: SignUpParamsDataModel(
              name: fullNameController.text,
              email: emailController.text,
              password: passwordController.text,
              rePassword: rePasswordController.text,
              phone: phoneNumberController.text));
    }
  }
}
