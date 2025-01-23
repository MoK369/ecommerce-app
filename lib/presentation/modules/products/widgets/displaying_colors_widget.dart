import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayingColorsWidget extends BaseViewStatelessWidget {
  final int index;
  final int color;
  final bool isSelected;
  final void Function(int index) onColorTap;
  const DisplayingColorsWidget(
      {super.key,
      required this.index,
      required this.color,
      this.isSelected = false,
      required this.onColorTap});

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onColorTap(index);
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 8,left: 2,right: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color(0xFF000000 | color)),
        child: isSelected
            ? const Center(
                child: Icon(
                Icons.check,
                color: Colors.white,
              ))
            : null,
      ),
    );
  }
}
