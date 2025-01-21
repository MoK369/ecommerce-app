import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String title;

  final bool isSelected;
  final Function onItemClick;

  const CategoryItem(this.index, this.title, this.isSelected, this.onItemClick,
      {super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // Handle item click by calling onItemClick callback
    return InkWell(
      onTap: () => onItemClick(index),
      child: Container(
        // Set background color based on selection
        color: isSelected ? Colors.white : Colors.transparent,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: 8.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppThemes.lightOnPrimaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: theme.textTheme.labelMedium!
                    .copyWith(color: AppThemes.lightOnPrimaryColor),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
