import 'package:ecommerce/presentation/core/widgets/custom_cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  final String brandImage;
  const BrandCard({super.key, required this.brandImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CustomCachedNetworkImageWidget(
                imageUrl: brandImage, shimmerWidth: 100.w, shimmerHeight: 100.h),
          ),
        ),
      ],
    );
    ;
  }
}
