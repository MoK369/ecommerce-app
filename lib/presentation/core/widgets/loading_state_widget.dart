import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingStateWidget extends BaseViewStatelessWidget {
  final String? loadingMessage;
  const LoadingStateWidget({super.key, this.loadingMessage});

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
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
