import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductNameAndPriceSection extends BaseViewStatelessWidget {
  final String productName, productPrice;
  const ProductNameAndPriceSection({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget customBuild(context, theme) {
    return RPadding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(
            productName,
            style: theme.textTheme.labelLarge!.copyWith(
                fontSize: 18.sp, color: AppThemes.lightOnPrimaryColor),
          ),
          const Spacer(),
          Text(
            "EGP $productPrice",
            style: theme.textTheme.labelLarge!.copyWith(
                fontSize: 18.sp, color: AppThemes.lightOnPrimaryColor),
          ),
        ],
      ),
    );
  }
}
