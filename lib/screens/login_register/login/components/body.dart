import 'package:ecommerce_app_mobile/screens/login_register/login/components/sign_in_form.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/sign_up_screen.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Login Screen
        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
               Center(
                  child: Image.asset(
                    'assets/images/anhchinh.png',
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenWidth(130),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(36),
                ),
                Center(
                  child: Text(
                    "Đăng nhập tài khoản member",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),SizedBox(
                  height: getProportionateScreenHeight(45),
                ),
                Center(
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.85,
                    child: SignInForm(),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(2),
                      color: Colors.grey[400],
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        "Hoặc đăng nhập bằng",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          //color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/Google_Icon.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chưa có tài khoản? ",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                          context, SignUpScreen.routeName),
                          child: Text(
                            "Đăng ký ngay",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                  height: getProportionateScreenHeight(15), ),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Xem chính sách ưu đãi member",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline, 
                          decorationColor: Colors.red,
                          decorationThickness: 2.0,
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}