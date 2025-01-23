import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceAndAddToCartSection extends BaseViewStatelessWidget {
  final String totalPrice;
  final void Function() onTap;
  const TotalPriceAndAddToCartSection({super.key, required this.totalPrice,required this.onTap});

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "Total Price",
              style: theme.textTheme.labelMedium!.copyWith(
                  color: AppThemes.lightOnPrimaryColor.withOpacity(0.7),
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "EGP $totalPrice",
              style: theme.textTheme.labelMedium!.copyWith(
                  color: AppThemes.lightOnPrimaryColor, fontSize: 18.sp),
            )
          ],
        ),
        SizedBox(
          width: 33.w,
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: onTap,
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(0, 50.h)),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppThemes.lightOnPrimaryColor)),
              child: ListTile(
                minTileHeight: 20,
                leading: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                title: Text(
                  "Add to cart",
                  style: theme.textTheme.labelMedium!.copyWith(fontSize: 20.sp),
                ),
              )),
        )
      ],
    );
  }
}
