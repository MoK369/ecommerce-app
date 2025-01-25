import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/api_error_message/api_error_message.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/head_item_card.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesSection extends StatefulWidget {
  final SubcategoriesViewModel subcategoriesViewModel;
  final CategoriesPageState previousStateOfCategoryPage;
  final CategoryData selectedCategoryItem;
  const SubCategoriesSection(
      {super.key,
      required this.selectedCategoryItem,
      required this.previousStateOfCategoryPage,
      required this.subcategoriesViewModel});

  @override
  State<SubCategoriesSection> createState() => _SubCategoriesSectionState();
}

class _SubCategoriesSectionState
    extends BaseViewStatefulWidget<SubCategoriesSection> {
  CategoriesViewModel categoriesViewModel = getIt.get<CategoriesViewModel>();
  @override
  void initState() {
    super.initState();
    debugPrint(widget.previousStateOfCategoryPage.toString());
    if (widget.previousStateOfCategoryPage is! OnCategoriesProductsState) {
      debugPrint("initState subcategory");
      widget.subcategoriesViewModel
          .loadSubcategories(widget.selectedCategoryItem.id ?? "");
    }
  }

  @override
  void didUpdateWidget(covariant SubCategoriesSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategoryItem != widget.selectedCategoryItem) {
      debugPrint("didUpdateWidget subcategory");
      widget.subcategoriesViewModel
          .loadSubcategories(widget.selectedCategoryItem.id ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              '${widget.selectedCategoryItem.name}',
              style: theme.textTheme.labelMedium!
                  .copyWith(color: AppThemes.lightOnPrimaryColor),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: HeadItemCard(
                title: "${widget.selectedCategoryItem.name}",
                image: widget.selectedCategoryItem.image ?? "",
                navigation: () {}),
          ),
          // the grid view of the subcategories
          BlocBuilder<SubcategoriesViewModel, SubcategoriesState>(
            builder: (context, state) {
              switch (state) {
                case SubcategoriesLoadingState():
                  return const SliverToBoxAdapter(
                    child: LoadingStateWidget(),
                  );
                case SubcategoriesSuccessState():
                  var subCategoriesList = state.subcategories;
                  return subCategoriesList.isEmpty
                      ? SliverToBoxAdapter(
                          child: Center(
                              child: Text(
                            "No Subcategories",
                            style: theme.textTheme.labelMedium!.copyWith(
                                color: AppThemes.lightOnPrimaryColor,
                                fontSize: 18.sp),
                          )),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            childCount: subCategoriesList.length,
                            (context, index) => ItemCard(
                              categoryImagePath:
                                  widget.selectedCategoryItem.image ?? "",
                              subcategoryItem: subCategoriesList[index],
                            ),
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 16.w,
                            crossAxisSpacing: 10.h,
                          ));
                case SubcategoriesErrorState():
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(ApiErrorMessage.getErrorMessage(
                          exception: state.exception)),
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
