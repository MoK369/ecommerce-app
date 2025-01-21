import 'package:ecommerce/domain/api_error_message/api_error_message.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_state.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/widgets/category_card.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionBar(sectionName: "Categories", function: () {}),
        SizedBox(
          height: 325.h,
          child: BlocBuilder<CategoriesViewModel, CategoriesState>(
            builder: (context, state) {
              switch (state) {
                case CategoriesLoadingState():
                  return  const LoadingStateWidget();
                case CategoriesSuccessState():
                  var categories = state.listOfCategoryData;
                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                          categoryImage: categories[index].image ?? "",
                          categoryTitle: categories[index].name ?? "");
                    },
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  );
                case CategoriesErrorState():
                  return Center(
                      child: Text(ApiErrorMessage.getErrorMessage(
                          exception: state.exception)));
              }
            },
          ),
        ),
      ],
    );
  }
}
