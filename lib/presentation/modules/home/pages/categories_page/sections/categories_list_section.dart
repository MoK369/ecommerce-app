import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesListSection extends StatefulWidget {
  final List<CategoryData> categories;
  const CategoriesListSection({super.key, required this.categories});

  @override
  State<CategoriesListSection> createState() => _CategoriesListSectionState();
}

class _CategoriesListSectionState extends State<CategoriesListSection> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
        color: Color(0xFFEDF1F5),
        border: Border(
            // set the border for only 3 sides
            top: BorderSide(width: 1.5, color: AppThemes.lightOnPrimaryColor),
            left: BorderSide(width: 1.5, color: AppThemes.lightOnPrimaryColor),
            bottom: BorderSide(width: 1.5, color: AppThemes.lightOnPrimaryColor)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),

      // the categories items list
      child: ClipRRect(
        // clip the corners of the container that hold the list view
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        child: ListView.builder(
          itemCount: widget.categories.length,
          itemBuilder: (context, index) => CategoryItem(
              index,
              widget.categories[index].name ?? "",
              selectedIndex == index,
              onItemClick),
        ),
      ),
    ));
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
