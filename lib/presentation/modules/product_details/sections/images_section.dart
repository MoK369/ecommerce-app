import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:ecommerce/presentation/core/widgets/custom_cached_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSection extends StatelessWidget {
  final List<String> images;
  const ImagesSection({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                      width: 1, color: AppThemes.lightOnPrimaryColor),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: CustomCachedNetworkImageWidget(
                      imageUrl: images[index],
                      boxFit: BoxFit.cover,
                      shimmerWidth: 1,
                      shimmerHeight: 1),
                ),
              ),
              Positioned(
                bottom: 8,
                left: MediaQuery.of(context).size.width * 0.39,
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
              )
            ],
          );

          //   Container(
          //   width: double.infinity,
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   alignment: Alignment.bottomCenter,
          //   padding: const EdgeInsets.only(bottom: 10),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       border:
          //           Border.all(width: 1, color: AppThemes.lightOnPrimaryColor),
          //       image: DecorationImage(
          //           fit: BoxFit.cover, image: AssetImage(images[index]))),
          //   child: AnimatedSmoothIndicator(
          //     activeIndex: index,
          //     count: images.length,
          //     effect: ExpandingDotsEffect(
          //       dotHeight: 12.h,
          //       dotColor: Colors.white,
          //       activeDotColor: AppThemes.lightOnPrimaryColor,
          //       dotWidth: 12.w,
          //     ),
          //   ),
          // );
        },
        options: CarouselOptions(
          aspectRatio: 3 / 2,
          viewportFraction: 1,
          enableInfiniteScroll: false,
        ));
  }
}
