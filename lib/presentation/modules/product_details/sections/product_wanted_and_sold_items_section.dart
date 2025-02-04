import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/product_details/widgets/wanted_number_of_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWantedAndSoldItemsSection extends BaseViewStatelessWidget {
  final ProductData productItem;
  const ProductWantedAndSoldItemsSection(
      {super.key, required this.productItem});

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppThemes.lightOnPrimaryColor.withOpacity(0.5))),
          child: Text(
            "${productItem.sold ?? ""} Sold",
            style: theme.textTheme.labelMedium!.copyWith(
                fontSize: 14.sp, color: AppThemes.lightOnPrimaryColor),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        RichText(
            text: TextSpan(children: [
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              baseline: TextBaseline.ideographic,
              child: Icon(
                Icons.star,
                size: 25.sp,
                color: const Color(0xFFFDD835),
              )),
          TextSpan(
              text:
                  "${productItem.ratingsAverage ?? ""}(${productItem.ratingsQuantity})",
              style: theme.textTheme.labelMedium!.copyWith(
                  color: AppThemes.lightOnPrimaryColor, fontSize: 14.sp))
        ])),
        const Spacer(),
        WantedNumberOfItemsWidget(
          maxLimit: productItem.quantity ?? 0,
        )
      ],
    );
  }
}
