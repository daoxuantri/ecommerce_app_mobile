import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesCreen extends StatefulWidget {
  final List<String>? images ;
  const ImagesCreen({super.key, required this.images });

  @override
  State<ImagesCreen> createState() => _ImagesCreenState();
}

class _ImagesCreenState extends State<ImagesCreen> {
  int activeIndex = 0;
    final controller = CarouselController();

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: widget.images?.length ?? 0, // Sử dụng số lượng banner
            itemBuilder: (context, index, realIndex) {
              final banner = widget.images![index]; // Lấy banner từ danh sách
              return Image.network(
                banner, // Sử dụng URL hình ảnh từ banner
                width: 300,
              );
            },
            options: CarouselOptions(
              aspectRatio: 10 / 2,
              viewportFraction: 0.8,
              height: 200,
              autoPlay: true,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          Transform.scale(
            scale: 0.6,
            child: buildIndicator(),
          ),
        ],
      );
    }

    Widget buildIndicator() => AnimatedSmoothIndicator(
          onDotClicked: animateToSlide,
          effect: ExpandingDotsEffect(
              dotWidth: 15, activeDotColor: AppColor.colorFF3B30),
          activeIndex: activeIndex,
          count: widget.images?.length ?? 0, // Sử dụng số lượng banner
        );

    void animateToSlide(int index) => controller.animateToPage(index);
  }