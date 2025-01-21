import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarIcon extends StatelessWidget {
  final bool isIconSelected;
  final String iconPath;
  const BottomBarIcon(
      {super.key, required this.isIconSelected, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return isIconSelected
        ? Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(color: Colors.white,shape: BoxShape.circle),
            child: ImageIcon(AssetImage(iconPath),size: 24.r,))
        : ImageIcon(AssetImage(iconPath),size: 24.r,);
  }
}
