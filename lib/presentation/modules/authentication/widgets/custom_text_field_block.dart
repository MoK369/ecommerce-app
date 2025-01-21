import 'package:ecommerce/presentation/core/bases/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldBlock extends StatefulWidget {
  final TextEditingController? textFieldController;
  final String labelText, hintText;
  final TextInputType keyboardType;
  final double topPadding;
  final bool showPasswordVisibilityButton;
  final String? Function(String? inputText)? validatorFunc;
  const CustomTextFieldBlock(
      {super.key,
      this.textFieldController,
      required this.labelText,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.showPasswordVisibilityButton = false,
      this.topPadding = 32,
      this.validatorFunc});

  @override
  State<CustomTextFieldBlock> createState() => _CustomTextFieldBlockState();
}

class _CustomTextFieldBlockState extends BaseView<CustomTextFieldBlock> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: EdgeInsets.only(top: widget.topPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.labelText,
            style: theme.textTheme.labelMedium!.copyWith(fontSize: 18.sp),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText:
                widget.showPasswordVisibilityButton && !_isPasswordVisible,
            controller: widget.textFieldController,
            keyboardType: widget.keyboardType,
            validator: widget.validatorFunc,
            style: theme.textTheme.labelMedium!.copyWith(
              color: Colors.black,
              fontSize: (18.sp).clamp(12, 25),
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              errorStyle: theme.inputDecorationTheme.errorStyle!
                  .copyWith(fontSize: 12.sp),
              suffixIcon: !widget.showPasswordVisibilityButton
                  ? null
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: (24.sp).clamp(15, 30),
                        color: const Color(0xFF808080),
                      )),
              hintStyle: theme.inputDecorationTheme.hintStyle!.copyWith(
                fontSize: (18.sp).clamp(12, 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
