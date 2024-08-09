import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task/core/utils/app_colors.dart';

class CarsouselImages extends StatelessWidget {
  const CarsouselImages({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          height: 300.h,
          viewportFraction: 1,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: images[itemIndex],
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
