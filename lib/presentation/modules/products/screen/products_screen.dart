import 'package:ecommerce/di.dart';
import 'package:ecommerce/presentation/core/api_error_message/api_error_message.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/widgets/loading_state_widget.dart';
import 'package:ecommerce/presentation/modules/home/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/presentation/modules/products/manager/products_state.dart';
import 'package:ecommerce/presentation/modules/products/manager/products_view_model.dart';
import 'package:ecommerce/presentation/modules/products/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  final ProductsScreenParams params;
  const ProductsScreen({super.key, required this.params});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends BaseViewStatefulWidget<ProductsScreen> {
  ProductsViewModel productsViewModel = getIt.get<ProductsViewModel>();

  @override
  void initState() {
    super.initState();
    productsViewModel.loadProducts(
        categoryId: widget.params.categoryId,
        subcategoryId: widget.params.subcategoryId,
        brandId: widget.params.brandId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productsViewModel,
      child: Scaffold(
        appBar: const HomeScreenAppBar(showLeading: true,),
        resizeToAvoidBottomInset: false,
        body: RPadding(
          padding: const EdgeInsets.only(bottom: 8),
          child: BlocBuilder<ProductsViewModel, ProductsState>(
            builder: (context, state) {
              switch (state) {
                case ProductsLoadingState():
                  return const LoadingStateWidget();
                case ProductsSuccessState():
                  var products = state.products;
                  return products.isEmpty
                      ? Center(
                      child: Text(
                        "No Products",
                        style: theme.textTheme.labelMedium!.copyWith(
                            color: AppThemes.lightOnPrimaryColor,
                            fontSize: 20.sp),
                      ),
                                              )
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: products.length,
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 191 / 237,
                              mainAxisSpacing: 16.h,
                              crossAxisSpacing: 16.w),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: products[index],
                            );
                          },
                        );
                case ProductsErrorState():
                  return Center(
                      child: Text(ApiErrorMessage.getErrorMessage(
                          exception: state.exception)));
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProductsScreenParams {
  final String? categoryId, subcategoryId, brandId;
  ProductsScreenParams({this.categoryId, this.subcategoryId, this.brandId});
}
