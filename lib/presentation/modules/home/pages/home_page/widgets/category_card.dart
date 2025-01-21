import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/widgets/custom_cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String categoryImage, categoryTitle;
  const CategoryCard(
      {super.key, required this.categoryImage, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(360.r),
          child: Container(
            width: 100.r,
            height: 100.r,
            color: Colors.grey,
            child: CustomCachedNetworkImageWidget(
                imageUrl: categoryImage,
                shimmerWidth: 100.w,
                shimmerHeight: 100.h),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            categoryTitle,
            style: theme.textTheme.labelMedium!
                .copyWith(fontSize: 14.r, color: AppThemes.lightOnPrimaryColor),
          ),
        )
      ],
    );
  }
}
