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

  Timer ?_timer ; 
  void startTimer() {
  _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
    try {
      if (!mounted) return; 

      if (email != null && password != null) {
        await ApiServiceAuth().login(email!, password!);
        if (!mounted) return; 
        Navigator.pushReplacementNamed(
            context, NavigatorBottomBarHome.routeName);
      } else {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    } catch (e) {
      if (mounted) { 
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    } finally {
      timer.cancel();
    }
  });
}

@override
void dispose() {
  _timer?.cancel(); // Hủy bỏ timer nếu nó vẫn còn đang chạy
  super.dispose();
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