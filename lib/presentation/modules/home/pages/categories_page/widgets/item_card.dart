import 'package:ecommerce/di.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/catgories_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  final String imagePath, itemTitle;
  ItemCard({
    super.key,
    required this.imagePath,
    required this.itemTitle,
  });

  CategoriesPageViewModel categoriesPageViewModel =
      getIt.get<CategoriesPageViewModel>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        categoriesPageViewModel.changeState(OnCategoriesProductsState());
      },
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            itemTitle,
            overflow: TextOverflow.ellipsis,
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
