import 'dart:async';

import 'package:ecommerce_app_mobile/api/authencation.dart';
import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final String? email;
  late final String? password;
  late bool firstTime;

  @override
  void initState() {
    super.initState();
    _initialize();

  }

  Future<void> _initialize() async {
  await getdata();
  startTimer();
}

  Future<void> getdata() async{
    email = await UserSecurityStorage.getEmail();
    password = await UserSecurityStorage.getPassword();
  }
  void startTimer() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {

       
      try {
        if (email != null && password != null) {
          // await ApiServiceAuth().login(email!, password!);
          // Navigator.pushReplacementNamed(
          //     context, NavigatorBottomBar.routeName);
           Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      } catch (e) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
      timer.cancel();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColor.colorWhite,
      child: Center(
        child: Image.asset(
          "assets/images/anhchinh.png",
          width: 200,
          height: getProportionateScreenHeight(140),
        ),
      ),
    );
  }
  
  


}