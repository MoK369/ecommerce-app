import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/product_details/widgets/displaying_colors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsSection extends StatefulWidget {
  final List<int> colors;
  const ColorsSection({super.key, required this.colors});

  @override
  State<ColorsSection> createState() => _ColorsSectionState();
}

class _ColorsSectionState extends BaseViewStatefulWidget<ColorsSection> {
  int selectedColorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: theme.textTheme.labelLarge!
              .copyWith(color: AppThemes.lightOnPrimaryColor, fontSize: 18.sp),
        ),
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (BuildContext context, int index) {
              return DisplayingColorsWidget(
                index: index,
                color: widget.colors[index],
                isSelected: selectedColorIndex == index,
                onColorTap: (index) {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
