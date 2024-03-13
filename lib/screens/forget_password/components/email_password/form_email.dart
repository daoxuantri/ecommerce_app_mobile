import 'package:ecommerce_app_mobile/screens/login_register/login/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components_buttons/colors.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../bloc/forget_password_bloc.dart';

class FormEmailPass extends StatefulWidget {
  const FormEmailPass({super.key, required this.forgetPasswordBloc});
  final ForgetPasswordBloc forgetPasswordBloc;

  static String routeName = "/email_pass";

  @override
  State<FormEmailPass> createState() => _FormEmailPassState();
}

class _FormEmailPassState extends State<FormEmailPass> {
  final TextEditingController _controller = TextEditingController();
  // String? errorMessage;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        EdgeInsets.only(top: getProportionateScreenHeight(30)),
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(200),
                    child: Image.asset('assets/images/forgot_password.png',
                    width: 200,height: 200  ,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(20),
                      top: getProportionateScreenHeight(30)),
                  child: Column(
                    children: [
                      Text(
                        'Hãy điền email của bạn. Bạn sẽ nhận được mã    ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                      ),),
                      Text(
                        'OTP thông qua email bạn đã nhập.                            ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                      ),),
                      
                    ],
                  )
                ),
                SizedBox(height:  10,),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _controller,
                    onChanged: (value) /*=> widget.callbackEmail(value)*/ {},
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: "Nhập địa chỉ email",
                      labelStyle: TextStyle(color: Colors.black), 
                    ),
                    validator: (value) {
                      if (!emailValidatorRegExp.hasMatch(value!)) {
                        return kInvalidEmailError;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height:  20,),
                Container(
                  child: DefaultButton(
                    text: 'Gửi mã xác thực',
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = _controller.text;
                      widget.forgetPasswordBloc.add(InputEmailToVerifyEmailEvent(widget.forgetPasswordBloc, email));
                      }
                      
                    },
                  )
                ),
              ]),
        ),
      );

  }
}
