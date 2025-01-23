import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/modules/products/sections/app_bar_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/colors_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/description_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/images_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/product_name_and_price_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/product_wanted_and_sold_items_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/search_page_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/sizes_section.dart';
import 'package:ecommerce/presentation/modules/products/sections/total_price_and_add_to_cart_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends BaseViewStatefulWidget<ProductDetailsScreen> {
  bool isSearchClicked = false;
  final TextEditingController textEditingController = TextEditingController();
  final String productName = "Nike Air Jordon",
      productPrice = "3,500",
      numberOfSoldItems = "3,230 Sold",
      ratingText = "4.8 (7,500)",
      descriptionText =
          "Nike, Inc. is an American multinational corporation that manufactures and sells footwear, apparel, equipment, accessories, and services. It is the world's largest supplier of athletic shoes and apparel. Nike's extensive lineup includes iconic brands such as Air Jordan, Air Force, and Converse. The company aims to deliver innovative products and services to inspire athletes.Nike, Inc. is an American multinational corporation that manufactures and sells footwear, apparel, equipment, accessories, and services. It is the world's largest supplier of athletic shoes and apparel. Nike's extensive lineup includes iconic brands such as Air Jordan, Air Force, and Converse. The company aims to deliver innovative products and services to inspire athletes.  ",
      totalPrice = "3,500";
  List<int> productSizes = [38, 39, 40, 41, 42];
  List<int> productColors = [0x2F2929, 0xBC3018, 0x0973DD, 0x02B935, 0xFF645A];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBarSection(
              onSearchIconTap: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
            ),
            body: Column(
              children: [
                ImagesSection(),
                Expanded(
                  child: RPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        ProductNameAndPriceSection(
                            productName: productName,
                            productPrice: productPrice),
                        ProductWantedAndSoldItemsSection(
                          numberOfSoldItems: numberOfSoldItems,
                          ratingText: ratingText,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Expanded(
                          child: DescriptionSection(
                            descriptionText: descriptionText,
                            widgetsUnderDescription: [
                              SizedBox(
                                height: 16.h,
                              ),
                              SizesSection(
                                productSizes: productSizes,
                              ),
                              ColorsSection(colors: productColors),
                              SizedBox(
                                height: 48.h,
                              ),
                              TotalPriceAndAddToCartSection(
                                totalPrice: totalPrice,
                                onTap: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SearchPageSection(
              textEditingController: textEditingController,
              closeSearchBar: closeSearchBar,
              isSearchClicked: isSearchClicked),
        ],
      ),
    );
  }

  void closeSearchBar() {
    setState(() {
      FocusManager.instance.primaryFocus?.unfocus();
      isSearchClicked = !isSearchClicked;
      textEditingController.clear();
    });
  }
}
