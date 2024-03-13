import 'package:ecommerce_app_mobile/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/model/bloc_forgot.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/components/default_button.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../components_buttons/colors.dart';
import '../../../../constants.dart';
import '../../../../security_user/keyboard.dart';

class ResetPassScreen extends StatefulWidget {
  static String routeName ="/reset_password";
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  TextEditingController newPasswordController = TextEditingController();
    TextEditingController retypeNewPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool obscureNewPassText = true;
    bool obscureRetypeNewPassText = true;
    bool isVisible = false;
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    final ForgetPasswordBloc bloc = args.bloc;
    final String email = args.email;

    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          textAlign: TextAlign.center,
          'Quên mật khẩu',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        width: getFullWidth(),
        height: getFullHeight(),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(200),
                    child: Image.asset('assets/images/forgot_password.png'),
                  ),
                ),
                const Text(
                  'Nhập mật khẩu mới.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                  child: Text(
                    email,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _textFormField("Nhập mật khẩu mới", newPasswordController,
                          "Vui lòng nhập mật khẩu mới", obscureNewPassText),
                      _textFormField(
                          "Xác nhận mật khẩu",
                          retypeNewPasswordController,
                          "Vui lòng nhập lại mật khẩu mới",
                          obscureRetypeNewPassText),
                    ],
                  ),
                ),
                Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        errorText,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    )),
                Container(
                  width: getFullWidth(),
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(12),
                  ),
                  child: DefaultButton(
                  text: 'Xác thực',
                  press: () async {
                    if (_isNotValidDataFormField()) {
                        setState(() {
                          isVisible = true;
                          errorText;
                        });
                      } else {
                        setState(() {
                          isVisible = false;
                          String password = newPasswordController.text;
                          bloc.add(
                              VerifyEmailToChangePasswordEvent(email, password));
                        });
                      }
                  },
                ),
                ),
              ]),
        ),
      ),
    );
  }
  bool _isNotValidDataFormField() {
    if (_formKey.currentState!.validate()) {
      if (newPasswordController.text != retypeNewPasswordController.text) {
        errorText = "Nhập lại mật khẩu sai";
        return true;
      } 
    }

    return false;
  }

  Widget _textFormField(String hintText, TextEditingController controller,
      String errorText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onTapOutside: (event) {
          KeyboardUtil.hideKeyboard(context);
        },
        obscureText: obscureText,
        onSaved: (newValue) => controller.text = newValue!,
        onChanged: (value) {
          _formKey.currentState!.validate();
        },
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 1, color: AppColor.darkGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 2, color: AppColor.thinBlue),
          ),
          label: Text(
            hintText,
            textScaleFactor: 1,
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (hintText == "Nhập mật khẩu mới") {
                    obscureNewPassText = !obscureNewPassText;
                  } else {
                    obscureRetypeNewPassText = !obscureRetypeNewPassText;
                  }
                });
              },
              icon: obscureText == true
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              color: Colors.black,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return errorText;
          }
          if (value.length < 8) {
            return kShortPassError;
          }
          return null;
        },
      ),
    );
  }

  
}