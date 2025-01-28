import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/presentation/core/widgets/custom_pull_down_refresh_indicator.dart';
import 'package:ecommerce/presentation/core/widgets/error_state_widget.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_state.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/sections/categories_list_section.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/sections/sub_categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesViewModel categoriesViewModel = getIt.get<CategoriesViewModel>();
  SubcategoriesViewModel subcategoriesViewModel =
      getIt.get<SubcategoriesViewModel>();

  CategoryData? selectedCategoryItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => subcategoriesViewModel,
      child: RPadding(
        padding: const EdgeInsets.only(bottom: 2, top: 2),
        child: CustomPullDownRefreshIndicator(
          lottieAnimationPath:
              "assets/animations/categories_loading_indicator.json",
          onRefresh: () {
            categoriesViewModel.loadCategories();
          },
          child: BlocBuilder<CategoriesViewModel, CategoriesState>(
            builder: (context, state) {
              switch (state) {
                case CategoriesLoadingState():
                  return const LoadingStateWidget();
                case CategoriesSuccessState():
                  var categories = state.listOfCategoryData;
                  selectedCategoryItem = selectedCategoryItem ?? categories[0];
                  return Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      CategoriesListSection(
                        categories: categories,
                        selectedCategoryIndex: getCategoryItemIndex(
                            categories, selectedCategoryItem!),
                        onCategorySelection: (category) {
                          if (selectedCategoryItem != category) {
                            setState(() {
                              /* we wrote this line because before that the subcategories
                                  of old category item appears for a while when selecting a new category item*/
                              subcategoriesViewModel
                                  .changeState(SubcategoriesLoadingState());
                              selectedCategoryItem = category;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      SubCategoriesSection(
                        subcategoriesViewModel: subcategoriesViewModel,
                        selectedCategoryItem: selectedCategoryItem!,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  );
                case CategoriesErrorState():
                  return CustomScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    slivers: [
                      SliverFillRemaining(
                          child: ErrorStateWidget(exception: state.exception))
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  int getCategoryItemIndex(
      List<CategoryData> categories, CategoryData categoryItem) {
    int index = 0;
    for (var category in categories) {
      if (category.name == categoryItem.name) {
        return index;
      } else {
        index++;
      }
    }
    return -1;
  }
}
