import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/app_bar_section.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/description_section.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/images_section.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/product_name_and_price_section.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/product_wanted_and_sold_items_section.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/search_page_section.dart';
import 'package:ecommerce/presentation/modules/product_details/sections/total_price_and_add_to_cart_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductData productItem;
  const ProductDetailsScreen({super.key, required this.productItem});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends BaseViewStatefulWidget<ProductDetailsScreen> {
  bool isSearchClicked = false;
  final TextEditingController textEditingController = TextEditingController();
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
                ImagesSection(
                  images: widget.productItem.images ?? [],
                ),
                Expanded(
                  child: RPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        ProductNameAndPriceSection(
                            productName: widget.productItem.title ?? "",
                            productPrice: getProductPrice()),
                        ProductWantedAndSoldItemsSection(
                          productItem: widget.productItem,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Expanded(
                          child: DescriptionSection(
                            descriptionText:
                                "${widget.productItem.description ?? ""} ",
                            widgetsUnderDescription: [
                              // SizedBox(
                              //   height: 16.h,
                              // ),
                              // SizesSection(
                              //   productSizes: productSizes,
                              // ),
                              // ColorsSection(colors: productColors),
                              SizedBox(
                                height: 48.h,
                              ),
                              TotalPriceAndAddToCartSection(
                                totalPrice: getProductPrice(),
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

  String getProductPrice() {
    if (widget.productItem.priceAfterDiscount == null ||
        widget.productItem.priceAfterDiscount == 0) {
      return "EGP ${widget.productItem.price ?? ""}";
    } else {
      return "EGP ${widget.productItem.priceAfterDiscount ?? ""}";
    }
  }
}
