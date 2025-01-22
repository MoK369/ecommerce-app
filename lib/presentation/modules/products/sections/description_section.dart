import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DescriptionSection extends StatefulWidget {
  final String descriptionText;
  final List<Widget>? widgetsUnderDescription;
  const DescriptionSection(
      {super.key, required this.descriptionText, this.widgetsUnderDescription});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState
    extends BaseViewStatefulWidget<DescriptionSection> {
  List<int> productSizes = [38, 39, 40, 41, 42];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Description",
            style: theme.textTheme.labelLarge!.copyWith(
                color: AppThemes.lightOnPrimaryColor, fontSize: 18.sp)),
        ReadMoreText(
          widget.descriptionText,
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Read More",
          trimExpandedText: "Read Less",
          lessStyle: theme.textTheme.labelMedium!
              .copyWith(color: Colors.black, fontSize: 16.sp),
          moreStyle: theme.textTheme.labelMedium!
              .copyWith(color: Colors.black, fontSize: 16.sp),
          style: GoogleFonts.poppins(
              fontSize: 15.sp, color: AppThemes.lightOnPrimaryColor),
        ),
        if (widget.widgetsUnderDescription != null)
          Column(
            children: widget.widgetsUnderDescription!,
          )
      ],
    );
  }
}
