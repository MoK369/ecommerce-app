import 'package:ecommerce/presentation/core/bases/base_view.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/validate_functions/validate_functions.dart';
import 'package:ecommerce/presentation/modules/authentication/widgets/custom_text_field_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseView<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                            return ValidateFunctions.validationOfPhoneNumber(
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56.r,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
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
    );
  }
  void onSignUpClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    if(formKey.currentState!.validate() == true){

    }
  }
}
