import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../size_config.dart';
import '../../../../../components_buttons/colors.dart';
import '../../../../../constants.dart';
import '../../../../../security_user/keyboard.dart';
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
  ForgetPasswordBloc forgetPasswordBloc = ForgetPasswordBloc();


  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();

  bool isVisible = false;
  String errorText = "";
  bool obscureNewPassText = true;
  bool obscureRetypeNewPassText = true;

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
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
                    )),
                Container(
                  width: getFullWidth(),
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
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
                          forgetPasswordBloc.add(
                              VerifyEmailToChangePasswordEvent(email,otp));
                        });
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(20)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.thinBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: AppColor.thinBlue),
                        ),
                      ),
                    ),
                    child: Text(
                      "Xác thực",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.colorWhite,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: getFullWidth(),
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      forgetPasswordBloc.add(VerifyEmailToInputEmailEvent(email : email));
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(20)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.colorWhite),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: AppColor.darkGray),
                        ),
                      ),
                    ),
                    child: Text(
                      "Gửi lại",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.darkGray,
                      ),
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
