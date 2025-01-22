import 'package:ecommerce/di.dart';
import 'package:ecommerce/domain/api_error_message/api_error_message.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_state.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/catgories_page_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/sections/categories_list_section.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/sections/in_specific_category_section.dart';
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

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(bottom: 10,top: 2),
      child: BlocBuilder<CategoriesPageViewModel, CategoriesPageState>(
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
                      return Row(
                        children: [
                          CategoriesListSection(
                            categories: categories,
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          const InSpecificCategorySection(),
                          SizedBox(
                            width: 16.w,
                          ),
                        ],
                      );
                    case CategoriesErrorState():
                      return Center(
                          child: Text(ApiErrorMessage.getErrorMessage(
                              exception: state.exception)));
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
                  return ItemInfoCard();
                },
              );
          }
        },
      ),
    );
  }
}
