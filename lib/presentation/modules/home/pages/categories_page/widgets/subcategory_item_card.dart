import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';
import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/core/widgets/custom_cached_network_image_widget.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/catgories_page_view_model.dart';
import 'package:ecommerce/presentation/modules/products/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubcategoryItemCard extends StatelessWidget {
  final SubcategoryData subcategoryItem;
  final String categoryImagePath;
  SubcategoryItemCard(
      {super.key,
      required this.subcategoryItem,
      required this.categoryImagePath});

  CategoriesPageViewModel categoriesPageViewModel =
      getIt.get<CategoriesPageViewModel>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DefinedRoutes.productsScreenRouteName,
            arguments:
                ProductsScreenParams(subcategoryId: subcategoryItem.id ?? ""));
      },
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomCachedNetworkImageWidget(
                  imageUrl: categoryImagePath,
                  shimmerHeight: 70,
                  shimmerWidth: 70,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            subcategoryItem.name ?? "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: theme.textTheme.labelSmall!
                .copyWith(color: const Color(0xFF06004F), fontSize: 14.r),
          )
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   ThemeData theme = Theme.of(context);
  //   return Column(
  //     children: [
  //       ClipRRect(
  //           borderRadius: BorderRadius.circular(5),
  //           child: Image.asset(
  //             imagePath,
  //             width: 70.w,
  //             height: 70.h,
  //           )),
  //       Text(
  //         itemTitle,
  //         style: theme.textTheme.labelSmall!
  //             .copyWith(color: const Color(0xFF06004F), fontSize: 12.r),
  //       )
  //     ],
  //   );
  // }
}
