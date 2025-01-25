import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListSection extends StatefulWidget {
  final List<CategoryData> categories;
  final int selectedCategoryIndex;
  final void Function(CategoryData category) onCategorySelection;
  const CategoriesListSection(
      {super.key,
      required this.categories,
      required this.onCategorySelection,
      this.selectedCategoryIndex = 0});

  @override
  State<CategoriesListSection> createState() => _CategoriesListSectionState();
}

class _CategoriesListSectionState extends State<CategoriesListSection> {
  // Index of the currently selected category
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedCategoryIndex;
  }

  // @override
  // void didUpdateWidget(covariant CategoriesListSection oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //
  //   if (oldWidget.selectedIndex != widget.selectedIndex) {
  //     debugPrint("didUpdateWidget categoryList");
  //     selectedIndex = widget.selectedIndex;
  //   }
  // }

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
            bottom:
                BorderSide(width: 1.5, color: AppThemes.lightOnPrimaryColor)),
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
    //setState(() {
      selectedIndex = index;
    //});
    widget.onCategorySelection(widget.categories[index]);
  }
}
