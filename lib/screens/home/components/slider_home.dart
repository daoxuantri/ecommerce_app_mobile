import 'package:ecommerce_app_mobile/model/home/banners/banners.dart';
import 'package:ecommerce_app_mobile/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../components_buttons/colors.dart';

class SliderHome extends StatefulWidget {
  final List<BannerDataModel>? banner;
  final HomeBloc homeBloc;

  const SliderHome({super.key, required this.banner, required this.homeBloc});

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  int activeIndex = 0;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: widget.banner?.length ?? 0, // Sử dụng số lượng banner
          itemBuilder: (context, index, realIndex) {
            final banner = widget.banner![index]; // Lấy banner từ danh sách
            return Image.network(
              banner.images!, // Sử dụng URL hình ảnh từ banner
              height: 211,
              width: 350,
              fit: BoxFit.cover, // Đảm bảo hình ảnh được hiển thị đúng
            );
          },
          options: CarouselOptions(
            aspectRatio: 10 / 2,
            viewportFraction: 0.8,
            height: 175,
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
        count: widget.banner?.length ?? 0, // Sử dụng số lượng banner
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}