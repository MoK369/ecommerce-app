import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSection extends BaseViewStatelessWidget
    implements PreferredSizeWidget {
  void Function() onSearchIconTap;
  AppBarSection({super.key, required this.onSearchIconTap});

  //final TextEditingController textEditingController = TextEditingController();
  @override
  Widget customBuild(context, theme) {
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        color: AppThemes.lightOnPrimaryColor,
      ),
      centerTitle: true,
      title: Text(
        "Product Details",
        style: theme.textTheme.labelMedium!
            .copyWith(fontSize: 20.sp, color: AppThemes.lightOnPrimaryColor),
      ),
      actions: [
        IconButton(
          onPressed: onSearchIconTap,
          icon: Image.asset(
            "assets/icons/search_icon.png",
            width: 30.w,
            height: 30.h,
          ),
          color: AppThemes.lightOnPrimaryColor,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/shopping_cart_icon.png",
            width: 30.w,
            height: 30.h,
          ),
          color: AppThemes.lightOnPrimaryColor,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(0, 50.h);
}
