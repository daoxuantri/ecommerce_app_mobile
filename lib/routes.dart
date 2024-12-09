import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/screens/add_address/add_address_screen.dart';
import 'package:ecommerce_app_mobile/screens/address/address_screen.dart';
import 'package:ecommerce_app_mobile/screens/all_product/all_product_screen.dart';
import 'package:ecommerce_app_mobile/screens/category/my_category.dart';
import 'package:ecommerce_app_mobile/screens/checkout/checkout_screen.dart';
import 'package:ecommerce_app_mobile/screens/filter_category/list_product_cate_screen.dart'; 
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/reset_password/reset_pass.dart';
import 'package:ecommerce_app_mobile/screens/home/home_screen.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/forget_password.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/sign_up_screen.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/my_cart_screen.dart';
import 'package:ecommerce_app_mobile/screens/my_order/my_order_screen.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/my_profile_screen.dart';
import 'package:ecommerce_app_mobile/screens/product/product_screen.dart';
import 'package:ecommerce_app_mobile/screens/splash/splash_screen.dart';
import 'package:ecommerce_app_mobile/screens/user_information/edit_user_info/edit_user_info.dart';
import 'package:ecommerce_app_mobile/screens/vnpay/vnpay_screen.dart';
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
  MyProfileScreen.routeName :(context) => const MyProfileScreen(),
  //user 

  /*-----------------------------------------------------------------------------*/

  //form email pass
  // FormEmailPass.routeName : (context) => const FormEmailPass(),
  IDEmail.routeName : (context) => const IDEmail(),

  //respass
  ResetPassScreen.routeName : (context) => const ResetPassScreen(),
  
  //all product screen
  AllProductScreen.routeName :(context) => const AllProductScreen(),
  ProductScreen.routeName :(context) => const ProductScreen(),
  MyCartScreen.routeName :(context) => const MyCartScreen(),



  //children file user profile 
  EditUserInfo.routeName :(context) => const EditUserInfo(),
  AddressScreen.routeName :(context) => const AddressScreen(),
  AddAddressScreen.routeName: (context) => const AddAddressScreen(),

  //check-out
  CheckoutScreen.routeName : (context) => const CheckoutScreen(),
  VNPayScreen.routeName : (context) => const VNPayScreen(),

  ListAllProductCategoryScreen.routeName  : (context) => const ListAllProductCategoryScreen(),
  MyOrdersScreen.routeName : (context) => const MyOrdersScreen(),







};