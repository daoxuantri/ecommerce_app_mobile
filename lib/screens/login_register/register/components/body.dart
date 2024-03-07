import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/bloc/sign_up_bloc.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'background_sign_up.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatelessWidget {


  const Body({super.key, required this.signUpBloc});
  final SignUpBloc signUpBloc;

  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        //BackgroundSignup(),
        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/anhchinh.png',
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenWidth(130),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text(
                    "Đăng ký ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      fontWeight: FontWeight.w700,
                    ), 
                  ),
                GestureDetector(
                  //xử lý sự kiện
                      onTap: () => Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName),
                      child: Text(
                        "member",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          fontWeight: FontWeight.w700,
                           color: kPrimaryLightColor,
                        ),
                        
                      ),
                    ),
                     Text(
                      "  mới.",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
              ],
            ),
                
                SizedBox(
                  height: getProportionateScreenHeight(45),
                ),
              
                Center(
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.85,
                    child: SignUpForm(
                      signUpBloc: signUpBloc,
                    ),
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
                        "Hoặc đăng ký bằng",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          //color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
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
                    child: Image.asset(
                      'assets/images/Google_Icon.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Đã có tài khoản? ",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.black,
                      ),
                    ),
                    
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName),
                      child: Text(
                        "Đăng nhập ngay",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
