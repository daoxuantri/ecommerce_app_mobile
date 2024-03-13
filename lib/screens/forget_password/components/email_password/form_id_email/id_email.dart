import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/model/bloc_forgot.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../size_config.dart';
import '../../../../../components_buttons/colors.dart';
import '../../../../../constants.dart';
import '../../../../../security_user/keyboard.dart';
import '../../../../login_register/login/components/default_button.dart';
import '../../../bloc/forget_password_bloc.dart';
import 'otp_verify_form.dart';

class IDEmail extends StatefulWidget {
  static String routeName = "/id_email_change";

  const IDEmail({super.key});

  /* const IDEmail(
      {super.key, required this.forgetPasswordBloc, required this.email});
  final ForgetPasswordBloc forgetPasswordBloc;
  final String email;*/

  @override
  State<IDEmail> createState() => _IDEmailState();
}

class _IDEmailState extends State<IDEmail> {


  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();

  bool isVisible = false;
  String errorText = "";
  bool obscureNewPassText = true;
  bool obscureRetypeNewPassText = true;

  late final String? email;

  

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
                SizedBox(height: 20,),
                const Text(
                  'Một mã xác thực đã được gửi tới',
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
                OTPVerifyForm(
                  firstNumController: firstNumController,
                  secondNumController: secondNumController,
                  thirdController: thirdController,
                  fourthController: fourthController
                ),
                Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        errorText,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    )
                    ),
                SizedBox(height: 20,),
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
                              String otp =
                                  "${firstNumController.text}${secondNumController.text}${thirdController.text}${fourthController.text}";
                              bloc.add(
                                  VerifyEmailToChangeOTPEvent(bloc,email,otp));
                            });
                          }
                  },
                ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                      onTap: () async {
                        bloc.add(VerifyEmailToInputEmailEvent(email : email));
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarLoginSuccess('Vui lòng chờ trong giây lát'),
          );  
                      },
                      child: Text(
                        "Gửi lại",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                

              ]),
        ),
      ),
    );
  }

  bool _isNotValidDataFormField() {
      if (_isEmptyOTPCell()) {
        errorText = "Vui lòng nhập đủ mã OTP";
        return true;
      }
    return false;
  }

  bool _isEmptyOTPCell() {
    return firstNumController.text.isEmpty ||
        secondNumController.text.isEmpty ||
        thirdController.text.isEmpty ||
        fourthController.text.isEmpty;
  }


  
}
