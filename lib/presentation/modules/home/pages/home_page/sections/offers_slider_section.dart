import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersSliderSection extends StatelessWidget {
  const OffersSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RPadding(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return Image.asset("assets/images/offer_image${index + 1}.png");
            },
            options: CarouselOptions(
              height: 200.w,
              viewportFraction: 1,
              aspectRatio: 398 / 200,
              autoPlay: true,
              autoPlayCurve: Easing.legacyAccelerate,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(seconds: 3),
            )));
  }
}
