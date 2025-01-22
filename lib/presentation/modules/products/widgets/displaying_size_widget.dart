import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayingSizeWidget extends BaseViewStatelessWidget {
  final int size;
  final int sizeIndex;
  final bool isSelected;
  final void Function(int index) onSizeTap;
  const DisplayingSizeWidget({
    super.key,
    required this.sizeIndex,
    required this.size,
    required this.onSizeTap,
    this.isSelected = false,
  });

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onSizeTap(sizeIndex);
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppThemes.lightOnPrimaryColor : Colors.white),
        child: Center(
          child: Text(
            "$size",
            style: theme.textTheme.labelMedium!.copyWith(
                color:
                    isSelected ? Colors.white : AppThemes.lightOnPrimaryColor,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
