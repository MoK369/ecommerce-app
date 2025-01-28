import 'package:ecommerce/presentation/core/api_error_message/api_error_message.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/brands_state.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/brands_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/widgets/brand_card.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/widgets/category_card.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        CustomSectionBar(sectionName: "Brands", function: () {}),
        SizedBox(
          height: 325.h,
          child: BlocBuilder<BrandsViewModel, BrandsState>(
            builder: (context, state) {
              switch (state) {
                case BrandsLoadingState():
                  return const LoadingStateWidget();
                case BrandsSuccessState():
                  var brands = state.listOfBrandData;
                  return GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BrandCard(
                        brandItem: brands[index],
                      );
                    },
                    itemCount: brands.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  );
                case BrandsErrorState():
                  return Center(
                      child: Text(ApiErrorMessage.getErrorMessage(
                          exception: state.exception)));
              }
            },
          ),
        )
      ],
    );
  }
}
