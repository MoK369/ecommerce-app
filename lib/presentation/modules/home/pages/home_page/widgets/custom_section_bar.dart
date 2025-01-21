import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionBar extends StatelessWidget {
  final String sectionName;
  final Function function;
  const CustomSectionBar(
      {super.key, required this.sectionName, required this.function});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return RPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionName,
            style: theme.textTheme.labelLarge!
                .copyWith(color: const Color(0xFF06004F)),
          ),
          TextButton(
            onPressed: () {
              function();
            },
            child: Text(
              'view all',
              style: theme.textTheme.labelMedium!
                  .copyWith(color: const Color(0xFF06004F)),
            ),
          ),
        ],
      ),
    );
  }
}
