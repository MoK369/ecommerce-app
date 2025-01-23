import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPageSection extends BaseViewStatelessWidget {
  final TextEditingController textEditingController;
  final void Function() closeSearchBar;
  final bool isSearchClicked;
  const SearchPageSection(
      {super.key,
      required this.textEditingController,
      required this.closeSearchBar,
      required this.isSearchClicked});

  @override
  Widget customBuild(context, theme) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.transparent,
      child: Visibility(
        visible: isSearchClicked,
        child: Container(
            height: double.infinity,
            padding: EdgeInsets.only(top: 4.h, left: 12.w, right: 12.w),
            color: Colors.black.withOpacity(0.5),
            child: InkWell(
              onTap: () {
                closeSearchBar();
              },
              child: Column(
                children: [
                  SlideInRight(
                    duration: const Duration(milliseconds: 200),
                    child: TextFormField(
                      controller: textEditingController,
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
                              onTap: () {
                                closeSearchBar();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppThemes.lightOnPrimaryColor,
                              ),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              textEditingController.clear();
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: AppThemes.lightOnPrimaryColor,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
