import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: Image.asset(
        "assets/icons/app_bar_icon.png",
        height: 55.h,
        width: 55.w,
      ),
      bottom: PreferredSize(
          preferredSize: Size(100.w, 60.h),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppThemes.lightOnPrimaryColor,
                    style: theme.textTheme.labelMedium!
                        .copyWith(color: Colors.black, fontSize: 14.sp),
                    decoration: InputDecoration(
                        hintText: "what do you search for?",
                        hintStyle: theme.inputDecorationTheme.hintStyle!
                            .copyWith(fontSize: 14.sp),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 25.h, minWidth: 25.w),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: InkWell(
                            onTap: () {},
                            child: const ImageIcon(
                              AssetImage("assets/icons/search_icon.png"),
                            ),
                          ),
                        )),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    //Navigator.pushNamed(context, Routes.cartRoute),
                    icon: const ImageIcon(
                      AssetImage("assets/icons/shopping_cart_icon.png"),
                      color: AppThemes.lightOnPrimaryColor,
                    ))
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
