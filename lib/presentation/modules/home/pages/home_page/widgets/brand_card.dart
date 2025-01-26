import 'package:ecommerce/domain/models/brands/brands_model.dart';
import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/core/widgets/custom_cached_network_image_widget.dart';
import 'package:ecommerce/presentation/modules/products/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  final BrandData brandItem;
  const BrandCard({super.key, required this.brandItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DefinedRoutes.productsScreenRouteName,
            arguments:
            ProductsScreenParams(brandId: brandItem.id ?? ""));
      },
      child: Column(
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
                  imageUrl: brandItem.image ?? "",
                  shimmerWidth: 100.w,
                  shimmerHeight: 100.h),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
