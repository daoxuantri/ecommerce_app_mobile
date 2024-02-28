import 'package:ecommerce_app_mobile/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String , WidgetBuilder> routes ={
  //splash
  SplashScreen.routeName : (context) => const SplashScreen(),

  //login
  LoginScreen.routeName : (context) => const LoginScreen(),


};