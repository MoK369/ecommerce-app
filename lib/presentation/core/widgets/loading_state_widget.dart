import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingStateWidget extends StatelessWidget {
  final String? loadingMessage;
  const LoadingStateWidget({super.key, this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (loadingMessage != null)
            Text(
              loadingMessage!,
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 14.sp),
            ),
        ],
      ),
    );
  }
}
