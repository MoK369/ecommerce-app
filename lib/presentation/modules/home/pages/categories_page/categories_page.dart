import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/api_error_message/api_error_message.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/presentation/core/widgets/custom_pull_down_refresh_indicator.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_state.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/catgories_page_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/sections/categories_list_section.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/sections/sub_categories_section.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/item_info_card.dart';
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
  CategoriesPageViewModel categoriesPageViewModel =
      getIt.get<CategoriesPageViewModel>();
  SubcategoriesViewModel subcategoriesViewModel =
      getIt.get<SubcategoriesViewModel>();

  CategoryData? selectedCategoryItem;
  CategoriesPageState previousStateOfCategoryPage = OnCategoriesListState();
  @override
  Widget build(BuildContext context) {
    debugPrint("selected category: ${selectedCategoryItem?.name}");
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
          child: BlocBuilder<CategoriesPageViewModel, CategoriesPageState>(
            buildWhen: (previous, current) {
              previousStateOfCategoryPage = previous;
              return true;
            },
            builder: (context, state) {
              switch (state) {
                case OnCategoriesListState():
                  return BlocBuilder<CategoriesViewModel, CategoriesState>(
                    builder: (context, state) {
                      switch (state) {
                        case CategoriesLoadingState():
                          return const LoadingStateWidget();
                        case CategoriesSuccessState():
                          var categories = state.listOfCategoryData;
                          selectedCategoryItem =
                              selectedCategoryItem ?? categories[0];
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
                                      subcategoriesViewModel.changeState(
                                          SubcategoriesLoadingState());
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
                                previousStateOfCategoryPage:
                                    previousStateOfCategoryPage,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                            ],
                          );
                        case CategoriesErrorState():
                          return ListView(
                            children: [
                              Center(
                                  child: Text(ApiErrorMessage.getErrorMessage(
                                      exception: state.exception))),
                            ],
                          );
                      }
                    },
                  );
                case OnCategoriesProductsState():
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 191 / 237,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w),
                    itemBuilder: (context, index) {
                      return const ItemInfoCard();
                    },
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
