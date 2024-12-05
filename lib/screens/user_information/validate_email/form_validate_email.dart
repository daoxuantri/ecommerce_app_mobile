import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:flutter/material.dart'; 

import '../../../size_config.dart';

class FormValidateEmail extends StatefulWidget {
  const FormValidateEmail({super.key});
  static String routeName = "/formvalidateemail";

  @override
  State<FormValidateEmail> createState() => _FormValidateEmailState();
}

class _FormValidateEmailState extends State<FormValidateEmail> {
  @override
  Widget build(BuildContext context) {
    String? email = ModalRoute.of(context)?.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Xác thực Email",
          style: TextStyle(color: AppColor.colorBlack),
        ),
      ),
      bottomSheet: Container(
        width: getFullWidth(),
        margin: EdgeInsets.only(
            bottom: getProportionateScreenHeight(20),
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        child: ElevatedButton(
          onPressed: () {
            // widget.forgetPasswordBloc
            //     .add(VerifyEmailToChangePasswordEvent());
          },
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(AppColor.thinBlue),
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: getProportionateScreenWidth(30),
              right: getProportionateScreenWidth(30),
              top: getProportionateScreenHeight(50)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  email ?? "",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
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
                  label: const Text(
                    "Nhập mã xác thực",
                    textScaleFactor: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
