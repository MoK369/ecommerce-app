import 'package:ecommerce/di.dart';
import 'package:ecommerce/presentation/core/widgets/custom_pull_down_refresh_indicator.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/brands_view_model.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/sections/brands_section.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/sections/categories_section.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/sections/offers_slider_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoriesViewModel categoriesViewModel = getIt.get<CategoriesViewModel>();
  BrandsViewModel brandsViewModel = getIt.get<BrandsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CustomPullDownRefreshIndicator(
      lottieAnimationPath: "assets/animations/home_loading_indicator.json",
      onRefresh: () {
        loadHomeScreenData();
      },
      child: const SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            OffersSliderSection(),
            CategoriesSection(),
            BrandsSection(),
          ],
        ),
      ),
    );
  }

  void loadHomeScreenData() {
    categoriesViewModel.loadCategories();
    brandsViewModel.loadBrands();
  }
}
