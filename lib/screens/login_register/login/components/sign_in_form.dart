import 'package:ecommerce_app_mobile/api/authencation.dart';
import 'package:ecommerce_app_mobile/components_buttons/bottom_navbar_home.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/components/default_button.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/forget_password.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../security_user/keyboard.dart';
import '../../../../size_config.dart';
import '../../../../components_buttons/snackbar.dart';

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
        color: backgroundcolor,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EmailFormField(),
            SizedBox(height: getProportionateScreenHeight(13)),
            PasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                GestureDetector(
                    onTap: () => (
                      Navigator.pushNamed(context, ForgetPassWordScreen.routeName)
                    ),
                    child: Text(
                      "Quên mật khẩu?",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
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
                          SnackBarLoginSuccess('Đăng nhập thành công'),);
                          Navigator.pushReplacementNamed(context, NavigatorBottomBarHome.routeName);

                      
                    
                  } catch (e) {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBarLoginFail(e.toString().replaceFirst('Exception: ', '')),
                    );
                  }
                }
              },
            ),
            
          ],
        ),
      ),
    );
  }


  TextFormField PasswordFormField() {
    return TextFormField(
      obscureText: obscureText,
      onSaved: (newValue) => password = newValue,
      // validator: (value) {
      //   return null;
      // },
      style: TextStyle(
        fontSize: getProportionateScreenHeight(18),
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Mật khẩu",
        labelStyle: TextStyle(color: Colors.black), 
        fillColor: Colors.white,
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
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black), 
      ),
      
    
    );
  }

  

  
}