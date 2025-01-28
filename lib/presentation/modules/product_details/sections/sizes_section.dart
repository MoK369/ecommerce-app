import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/product_details/widgets/displaying_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizesSection extends StatefulWidget {
  final List<int> productSizes;
  const SizesSection({super.key, required this.productSizes});

  @override
  State<SizesSection> createState() => _SizesSectionState();
}

class _SizesSectionState extends BaseViewStatefulWidget<SizesSection> {
  int selectedSizeIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: theme.textTheme.labelLarge!
              .copyWith(color: AppThemes.lightOnPrimaryColor, fontSize: 18.sp),
        ),
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: widget.productSizes.length,
            itemBuilder: (BuildContext context, int index) {
              return DisplayingSizeWidget(
                sizeIndex: index,
                size: widget.productSizes[index],
                isSelected: selectedSizeIndex == index,
                onSizeTap: (index) {
                  setState(() {
                    selectedSizeIndex = index;
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
