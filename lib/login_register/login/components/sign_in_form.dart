import 'package:ecommerce_app_mobile/api/authencation.dart';
import 'package:ecommerce_app_mobile/login_register/login/components/default_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../security_user/keyboard.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final ApiServiceAuth authentication = ApiServiceAuth();

  String? email;
  String? password;
  bool obscureText = true;
  String wrongPassword = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenHeight(20),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(30)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              EmailFormField(),
              SizedBox(height: getProportionateScreenHeight(35)),
              PasswordFormField(),
              SizedBox(height: getProportionateScreenHeight(10)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  GestureDetector(
                      onTap: () => (
                        //code
                      ),
                      child: Text(
                        "Quên mật khẩu",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: kLabelColor,
                        ),
                      ),
                    ),
                  ],
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              DefaultButton(
                text: 'Đăng nhập',
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    try {
                          await authentication.login(email!, password!);
                     

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarLoginSuccess(),
                      );
                      // Navigator.pushReplacementNamed(
                      //     context, NavigatorBottomBarHome.routeName);
                    } catch (e) {
                      wrongPassword = e.toString();
                      if (wrongPassword.startsWith('Exception: ')) {
                        wrongPassword =
                            wrongPassword.substring('Exception: '.length);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarLoginFail(wrongPassword),
                      );
                    }
                  }
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }


  TextFormField PasswordFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        }
        if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: "Mật khẩu",
       
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
          child: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: obscureText == true
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  TextFormField EmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        hintText: "Tên đăng nhập",
        
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  SnackBar SnackBarLoginSuccess() {
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
              'Đăng nhập thành công',
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

  SnackBar SnackBarLoginFail(String wrongPassword) {
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
              wrongPassword,
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
}