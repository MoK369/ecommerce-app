import 'dart:math';
import 'package:ecommerce/presentation/core/bases/base_view_stateful_widget.dart';
import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/widgets/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemInfoCard extends StatefulWidget {

  const ItemInfoCard({super.key});

  @override
  State<ItemInfoCard> createState() => _ItemInfoCardState();
}

class _ItemInfoCardState extends BaseViewStatefulWidget<ItemInfoCard> {
  bool isThereDiscount = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, DefinedRoutes.productDetailsScreenRouteName);
      },
      child: Container(
        width: 191.w,
        height: 237.h,
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.topRight,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/shoes_example.jpeg",
                    ),
                  )),
              child: const HeartButton(),
            )),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double w = constraints.maxWidth / 191,
                      h = constraints.maxHeight / 237,
                      sp = max(w, h);
                  return RPadding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Nike Air Jordon",
                          style: theme.textTheme.labelMedium!.copyWith(
                              color: const Color(0xFF06004F),
                              fontSize: 14 * sp),
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Nike shoes flexible for work and ",
                          style: theme.textTheme.labelMedium!.copyWith(
                              color: const Color(0xFF06004F),
                              fontSize: 14 * sp),
                        ),
                        SizedBox(
                          height: 8 * h,
                        ),
                        Row(
                          children: [
                            Text(
                              "EGP 1,200",
                              style: theme.textTheme.labelMedium!.copyWith(
                                  color: const Color(0xFF06004F),
                                  fontSize: 14 * sp),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            !isThereDiscount
                                ? const SizedBox()
                                : Text(
                                    "1,200 EGP",
                                    style: theme.textTheme.labelMedium!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                const Color(0xFF418299),
                                            color: const Color(0xFF418299)
                                                .withOpacity(0.6),
                                            fontSize: 11 * sp),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 8 * h,
                        ),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Review (4.6)",
                                style: theme.textTheme.labelMedium!.copyWith(
                                    color: const Color(0xFF06004F),
                                    fontSize: 12 * sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  baseline: TextBaseline.ideographic,
                                  child: Icon(
                                    Icons.star,
                                    size: 20.w,
                                    color: const Color(0xFFFDD835),
                                  ))
                            ])),
                            const Spacer(),
                            InkWell(
                              borderRadius: BorderRadius.circular(360),
                              onTap: () {},
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppThemes.lightOnPrimaryColor,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
