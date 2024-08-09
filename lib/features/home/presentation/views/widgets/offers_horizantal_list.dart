import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersHorizantalList extends StatelessWidget {
  const OffersHorizantalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: MediaQuery.sizeOf(context).width,
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/carousel${index + 1}.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        options: CarouselOptions(height: 160.h, viewportFraction: 0.9),
      ),
    );
  }
}
