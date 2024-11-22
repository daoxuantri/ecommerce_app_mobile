import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/screens/all_product/all_product_screen.dart';
import 'package:ecommerce_app_mobile/screens/category/my_category.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/reset_password/reset_pass.dart';
import 'package:ecommerce_app_mobile/screens/home/home_screen.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/forget_password.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/sign_up_screen.dart';
import 'package:ecommerce_app_mobile/screens/product/product_screen.dart';
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

   /*-------------------Dieu huong bottom navigation bar--------------------------*/
   
  //Navigator Bottom bar
  NavigatorBottomBarHome.routeName : (context) => const NavigatorBottomBarHome(),

  //home
  HomeScreen.routeName : (context) => const HomeScreen(),
  //category
  CategoryScreen.routeName :(context) => const CategoryScreen(),

  /*-----------------------------------------------------------------------------*/

  //form email pass
  // FormEmailPass.routeName : (context) => const FormEmailPass(),
  IDEmail.routeName : (context) => const IDEmail(),

  //respass
  ResetPassScreen.routeName : (context) => const ResetPassScreen(),
  
  //all product screen
  AllProductScreen.routeName :(context) => const AllProductScreen(),
  ProductScreen.routeName :(context) => const ProductScreen(),





};