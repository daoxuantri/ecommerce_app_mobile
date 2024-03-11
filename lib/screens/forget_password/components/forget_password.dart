import 'package:ecommerce_app_mobile/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../size_config.dart';

import '../../../components_buttons/colors.dart';

bool showFormPhonePass = true;

class ForgetPassWordForm extends StatefulWidget {
  const ForgetPassWordForm({super.key, required this.forgetPasswordBloc});
  final ForgetPasswordBloc forgetPasswordBloc;

  @override
  State<ForgetPassWordForm> createState() => _ForgetPassWordFormState();
}

class _ForgetPassWordFormState extends State<ForgetPassWordForm> {
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
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(50)),
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenHeight(200),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          ExactAssetImage('assets/images/anhchinh.png'),
                      fit: BoxFit.contain)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(40),
                  getProportionateScreenHeight(10),
                  getProportionateScreenWidth(40),
                  getProportionateScreenHeight(10)),
              width: getFullWidth(),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.colorWhite),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: AppColor.darkGray),
                    ),
                  ),
                ),
                onPressed: () {
                  widget.forgetPasswordBloc
                      .add(ForgetPasswordToInputEmailEvent(widget.forgetPasswordBloc));
                },
                icon: Icon(
                  Icons.email,
                  size: 24,
                  color: AppColor.colorBlack,
                ),
                label: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Đổi lại mật khẩu với email',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColor.colorBlack),
                    ),
                  ],
                ), // <-- Text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
