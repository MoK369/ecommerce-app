import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/validate_functions/validate_functions.dart';
import 'package:ecommerce/presentation/modules/authentication/widgets/custom_text_field_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseViewStatefulWidget<SignInScreen> {
  final TextEditingController userNameFieldController = TextEditingController(),
      passwordFieldController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    // print((237.w) / 237);
    // print((71.1.h) / 71.1);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppThemes.lightOnPrimaryColor,
        body: SingleChildScrollView(
          child: RPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                  style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
                ),
                Text(
                  "Please sign in with your mail",
                  style: theme.textTheme.labelSmall!.copyWith(fontSize: 16.sp),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFieldBlock(
                        textFieldController: userNameFieldController,
                        topPadding: 40,
                        labelText: "Email",
                        hintText: "enter your email",
                        keyboardType: TextInputType.name,
                        validatorFunc: (inputText) {
                          return ValidateFunctions.validationOfFullName(
                              context, inputText);
                        },
                      ),
                      CustomTextFieldBlock(
                        textFieldController: passwordFieldController,
                        labelText: "Password",
                        hintText: "enter your password",
                        showPasswordVisibilityButton: true,
                        validatorFunc: (inputText) {
                          if (inputText?.trim().isEmpty == true ||
                              inputText == null) {
                            return "Please enter your password.";
                          }
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
                                padding: EdgeInsets.symmetric(vertical: 20.r)),
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
    );
  }

  void onLoginClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate() == true) {}
    Navigator.pushNamedAndRemoveUntil(
      context,
      DefinedRoutes.homeScreenRouteName,
      (route) => false,
    );
  }
}
