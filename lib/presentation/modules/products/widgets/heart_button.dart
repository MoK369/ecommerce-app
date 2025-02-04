import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  const HeartButton({super.key, this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String unclickedHeart = "assets/icons/heart_icon.png",
      clickedHeart = "assets/icons/clicked_heart.png";
  String currentHeartIcon = "assets/icons/heart_icon.png";
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        // radius: 25,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onTap: () {
          setState(() {
            isClicked = !isClicked;
            currentHeartIcon = !isClicked ? unclickedHeart : clickedHeart;
            widget.onTap?.call();
          });
        },
        child: Material(
          // borderRadius: BorderRadius.circular(2),
          color: Colors.white,
          elevation: 5,
          shape: const StadiumBorder(),
          shadowColor: Colors.black,
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: ImageIcon(
                AssetImage(currentHeartIcon),
                color: AppThemes.lightOnPrimaryColor,
              )),
        ),
      ),
    );
  }
}
