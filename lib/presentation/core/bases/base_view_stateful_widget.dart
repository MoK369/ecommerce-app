import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseViewStatefulWidget<T extends StatefulWidget>
    extends State<T> {
  late ThemeData theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }

  void showAlertDialog(
      {required Widget titleWidget, bool showOkButton = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: titleWidget,
          actions: !showOkButton
              ? null
              : [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          surfaceTintColor: Colors.transparent,
                          backgroundColor: AppThemes.lightOnPrimaryColor,
                          padding: EdgeInsets.symmetric(vertical: 20.r)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: theme.textTheme.labelMedium!
                            .copyWith(fontSize: 18.sp),
                      ))
                ],
        );
      },
    );
  }
}
