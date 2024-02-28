import 'package:ecommerce_app_mobile/login_register/login/components/body.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Body(),
      ),
    );
  }
}