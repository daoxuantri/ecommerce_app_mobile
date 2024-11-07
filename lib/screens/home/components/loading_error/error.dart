import 'package:ecommerce_app_mobile/screens/home/components/loading_error/skelton.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';
import '../base_input.dart';
import '../slider_home.dart';
import '../text_title.dart';

class ErrorStateScreen extends StatelessWidget {
  final String message;
  final HomeBloc homeBloc;
  const ErrorStateScreen({super.key, required this.message, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    double x = 85;
    double x2 = SizeConfig.screenWidth * 0.4;
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InputHome(),
                const SliderHome(),
                const TextTitle(title: 'Danh mục'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Skeleton(
                      height: getProportionateScreenHeight(x),
                      width: getProportionateScreenHeight(x),
                    ),
                    Skeleton(
                      height: getProportionateScreenHeight(x),
                      width: getProportionateScreenHeight(x),
                    ),
                    Skeleton(
                      height: getProportionateScreenHeight(x),
                      width: getProportionateScreenHeight(x),
                    ),
                    Skeleton(
                      height: getProportionateScreenHeight(x),
                      width: getProportionateScreenHeight(x),
                    ),
                  ],
                ),
                const TextTitle(title: 'Đề xuất'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Skeleton(
                      height: SizeConfig.screenHeight * 0.2,
                      width: getProportionateScreenHeight(x2),
                    ),
                    Skeleton(
                      height: SizeConfig.screenHeight * 0.2,
                      width: getProportionateScreenHeight(x2),
                    ),
                  ],
                ),
                //ListPropose(products: successState.productsPropose),
                const TextTitle(title: 'Hoa sỉ'),
              ],
            ),
          ),
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            color: Colors.white.withOpacity(0.3),
            child: Center(
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        homeBloc.add(HomeErrorScreenToLoginEvent());
                      },
                      child: const Text('Đăng Nhập lại'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      title: Image.asset(
        'assets/images/anhchinh.png',
        height: 30,
        width: 151,
      ),
      actions: [
        Image.asset(
          'assets/images/IC_Bell.png',
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 20,
        ),
        const CircleAvatar(
          child: Icon(Icons.add),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
