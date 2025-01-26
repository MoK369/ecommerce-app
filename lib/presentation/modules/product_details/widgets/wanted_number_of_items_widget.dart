import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WantedNumberOfItemsWidget extends StatefulWidget {
  const WantedNumberOfItemsWidget({super.key});

  @override
  State<WantedNumberOfItemsWidget> createState() =>
      _WantedNumberOfItemsWidgetState();
}

class _WantedNumberOfItemsWidgetState
    extends BaseViewStatefulWidget<WantedNumberOfItemsWidget> {
  int currentWantedNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,
      height: 42.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppThemes.lightOnPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                setState(() {
                  if (currentWantedNumber > 1) currentWantedNumber--;
                });
              },
              child: Image.asset(
                "assets/icons/minus_circle_outlined.png",
                width: 22.w,
                color: Colors.white,
              )),
          Text(
            "$currentWantedNumber",
            style: theme.textTheme.labelMedium!.copyWith(fontSize: 18.sp),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  if (currentWantedNumber < 1000) currentWantedNumber++;
                });
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
