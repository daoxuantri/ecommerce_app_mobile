import 'package:ecommerce_app_mobile/login_register/login/components/sign_in_form.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

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
        //Login
        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(75),
                ),
                Center(
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.95,
                    child: SignInForm(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}