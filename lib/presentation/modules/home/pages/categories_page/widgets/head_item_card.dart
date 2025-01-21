import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadItemCard extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;
  const HeadItemCard(
      {super.key,
      required this.title,
      required this.image,
      required this.navigation});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // Create a container for the category card
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      // Height of the card set with fixed size to make all image same size but it can be deleted without affecting the code
      height: 150.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background image for the category
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Overlay with category title and button
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Category title
                      Text(
                        title,
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Shop Now button
                      SizedBox(
                        width: 110.w,
                        height: 35.h,
                        child: ElevatedButton(
                            onPressed: () {
                              navigation();
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(120.w, 30.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0),
                                backgroundColor: AppThemes.lightOnPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Text(
                              "Shop Now",
                              style: theme.textTheme.labelMedium,
                            )),
                      )
                    ],
                  )),
                  const Spacer()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
