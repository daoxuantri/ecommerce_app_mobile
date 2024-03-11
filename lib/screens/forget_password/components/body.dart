import 'package:flutter/material.dart';
import '../../../../../size_config.dart';
// import '../forget_password_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Screens screen = Screens.optionChangePW;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'Quên mật khẩu',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: getFullWidth(),
        height: getFullHeight(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(200),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                            'assets/images/forgot_password.png'),
                        fit: BoxFit.contain)),
              ),
              // screen == Screens.optionChangePW
              //     ? ForgetPassWordForm()
              //     : screen == Screens.inputEmail
              //         ? FormEmailPass()
              //         : screen == Screens.inputPhone
              //             ? FormPhonePass()
              //             : screen == Screens.verifyEmail
              //                 ? IDEmail()
              //                 : screen == Screens.changePassword
              //                     ? FormChangePassWord()
              //                     : SizedBox(),
            ]),
      ),
    );
  }
}
