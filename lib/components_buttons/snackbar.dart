import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';


//THÔNG BÁO : Đăng ký thành công 
SnackBar SnackBarLoginSuccess(String notification) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        height: getProportionateScreenHeight(50),
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: getProportionateScreenWidth(25)),
            Text(
              notification,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
          ],
        ),
      ),
    );
  }


//THÔNG BÁO : login fail 

  SnackBar SnackBarLoginFail(String notification) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        height: getProportionateScreenHeight(50),
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            SizedBox(width: getProportionateScreenWidth(25)),
            Text(
              notification,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
          ],
        ),
      ),
    );
  }



