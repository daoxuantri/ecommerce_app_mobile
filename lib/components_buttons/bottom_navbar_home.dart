import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/category/my_category.dart';
import 'package:ecommerce_app_mobile/screens/home/home_screen.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigatorBottomBarHome extends StatefulWidget {
  const NavigatorBottomBarHome({super.key});
  static String routeName = '/navigator-bottom-bar';

  @override
  State<NavigatorBottomBarHome> createState() => _NavigatorBottomBarState();
}

class _NavigatorBottomBarState extends State<NavigatorBottomBarHome> {
  var currentIndex = 0;
  List<String> listAssetsIcons = [
    "IC_Home.svg",
    "IC_Category.svg",
    "IC_Bag.svg",
    "IC_Favorite.svg",
    "IC_Profile.svg",
  ];
  final screens =[
      const HomeScreen(),
      const CategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 20),
        height: getProportionateScreenHeight(65),
        decoration: BoxDecoration(
          color: AppColor.colorWhite,
          boxShadow: [
            BoxShadow(
              color: AppColor.colorBlack.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listAssetsIcons.length,
            scrollDirection: Axis.horizontal,
            // padding:
            //     EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(32),
                    height: getProportionateScreenHeight(32),
                    child: SvgPicture.asset(
                      'assets/images/${listAssetsIcons[index]}',
                      // ignore: deprecated_member_use
                      color: index == currentIndex
                          ? AppColor.colorFF9500
                          : AppColor.colorBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    margin: EdgeInsets.only(
                      right: getProportionateScreenWidth(18),
                      left: getProportionateScreenWidth(18),
                    ),
                    width: getProportionateScreenWidth(33),
                    height: index == currentIndex
                        ? getProportionateScreenWidth(5)
                        : 0,
                    decoration: BoxDecoration(
                      color: AppColor.colorFF9500,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                ],
              ),
              // SizedBox(height: getProportionateScreenWidth(.03)),
            ),
          ),
        ),
      ),
    );
  }
}