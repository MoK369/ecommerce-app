import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSection extends StatelessWidget {
  ImagesSection({super.key});
  final List<String> images = [
    "assets/images/shoes_example.jpeg",
    "assets/images/shoes_example.jpeg",
    "assets/images/shoes_example.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1, color: AppThemes.lightOnPrimaryColor),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(images[index]))),
            child: AnimatedSmoothIndicator(
              activeIndex: index,
              count: images.length,
              effect: ExpandingDotsEffect(
                dotHeight: 12.h,
                dotColor: Colors.white,
                activeDotColor: AppThemes.lightOnPrimaryColor,
                dotWidth: 12.w,
              ),
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 3 / 2,
          viewportFraction: 1,
          enableInfiniteScroll: false,
        ));
  }
}
