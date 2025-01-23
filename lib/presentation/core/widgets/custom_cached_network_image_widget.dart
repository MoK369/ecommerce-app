import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double shimmerWidth, shimmerHeight;
  final BoxFit boxFit;
  const CustomCachedNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      required this.shimmerWidth,
      required this.shimmerHeight,
      this.boxFit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      width: shimmerWidth,
      height: shimmerHeight,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return SizedBox(
          width: shimmerWidth,
          height: shimmerHeight,
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.grey,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 14.w,
      ),
    );
  }
}
