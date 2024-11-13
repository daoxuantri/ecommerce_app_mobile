import 'package:ecommerce_app_mobile/screens/category/bloc/category_bloc.dart';
import 'package:ecommerce_app_mobile/screens/category/components/text_title.dart';
import 'package:ecommerce_app_mobile/screens/home/components/loading_error/skelton.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class ErrorStateScreen extends StatelessWidget {
  final String message;
  final CategoryBloc categoryBloc;
  const ErrorStateScreen({super.key, required this.message, required this.categoryBloc});

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
                const TextTitle(title: 'Danh mục sản phẩm'),
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
                        categoryBloc.add(CategoryErrorScreenToLoginEvent());
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
    );
  }
}
