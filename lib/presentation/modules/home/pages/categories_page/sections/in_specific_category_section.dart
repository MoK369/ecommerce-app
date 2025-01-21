import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/head_item_card.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InSpecificCategorySection extends StatelessWidget {
  const InSpecificCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              'Laptops & Electronics',
              style: theme.textTheme.labelMedium!
                  .copyWith(color: AppThemes.lightOnPrimaryColor),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: HeadItemCard(
                title: "Shirts",
                image: "assets/images/shirts_example.jpeg",
                navigation: () {}),
          ),
          // the grid view of the subcategories
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 15,
                (context, index) => ItemCard(
                    imagePath: "assets/images/item_example.png",
                    itemTitle: "anything Now"),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16.w,
                crossAxisSpacing: 10.h,
              ))
        ],
      ),
    );
  }
}
