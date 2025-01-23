import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomPullDownRefreshIndicator extends StatelessWidget {
  final void Function() onRefresh;
  final String lottieAnimationPath;
  final Widget child;
  const CustomPullDownRefreshIndicator(
      {super.key,
      required this.onRefresh,
      required this.lottieAnimationPath,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      durations: const RefreshIndicatorDurations(
          completeDuration: Duration(seconds: 1)),
      onRefresh: () async {
        Future.delayed(const Duration(seconds: 2));
        onRefresh();
      },
      indicatorBuilder: (context, controller) {
        return Lottie.asset(lottieAnimationPath, animate: true);
      },
      child: child,
    );
  }
}
