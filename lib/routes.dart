import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/forget_password.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/sign_up_screen.dart';
import 'package:ecommerce_app_mobile/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String , WidgetBuilder> routes ={
  //splash
  SplashScreen.routeName : (context) => const SplashScreen(),

  //login
  LoginScreen.routeName : (context) => const LoginScreen(),

  //forgotpassword
  ForgetPassWordScreen.routeName : (context) => const ForgetPassWordScreen(),

  //signup
  SignUpScreen.routeName :(context) => const SignUpScreen(),

  //Navigator Bottom bar
  NavigatorBottomBar.routeName : (context) => const NavigatorBottomBar(),


//form email pass
  // FormEmailPass.routeName : (context) => const FormEmailPass(),
  IDEmail.routeName : (context) => const IDEmail(),




};