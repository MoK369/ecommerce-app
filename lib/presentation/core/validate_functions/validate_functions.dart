import 'package:flutter/material.dart';

class ValidateFunctions {
  static String? validationOfFullName(BuildContext context, String? inputText) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your name.";
    }
    return null;
  }

  static String? validationOfEmail(BuildContext context, String? inputText) {
    RegExp gmailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your E-mail.";
    }
    if (!gmailRegExp.hasMatch(inputText)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  static String? validationOfPhoneNumber(
      BuildContext context, String? inputText) {
    RegExp phoneNumber = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your phone number.";
    } else if (!phoneNumber.hasMatch(inputText)) {
      return "Please, enter a correct number\nstarts with one of the valid prefixes:\n010, 011, 012, or 015\nfollowed by exactly 8 digits.";
    }
    return null;
  }

  static String? validationOfPassword(BuildContext context, String? inputText) {
    RegExp passValid = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{6,}$');
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your password.";
    } else if (!passValid.hasMatch(inputText)) {
      return "Please, write at least 6 characters\ncontains at least one digit,\none letter and one\nspecial character";
    }
    return null;
  }

  static String? validationOfConfirmPassword(BuildContext context,
      String? inputText, TextEditingController passwordCont) {
    if (inputText?.trim().isEmpty == true || inputText == null) {
      return "Please enter your confirm password.";
    } else if (inputText != passwordCont.text) {
      return "No Match";
    }
    return null;
  }
}
