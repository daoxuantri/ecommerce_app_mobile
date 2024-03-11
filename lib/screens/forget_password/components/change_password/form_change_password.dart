import 'package:ecommerce_app_mobile/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../size_config.dart';
import '../../../../components_buttons/colors.dart';

TextFormField _textFormField(text, function) {
  return TextFormField(
    onChanged: function,
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
        text,
        textScaleFactor: 1,
      ),
    ),
  );
}

class FormChangePassWord extends StatefulWidget {
  // static String routeName = "/changepassword";
  const FormChangePassWord({super.key, required this.forgetPasswordBloc});
  final ForgetPasswordBloc forgetPasswordBloc;

  @override
  State<FormChangePassWord> createState() => _FormChangePassWordState();
}

class _FormChangePassWordState extends State<FormChangePassWord> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(200),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                            'assets/images/change_password.png'),
                        fit: BoxFit.contain)),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(20),
                    top: getProportionateScreenHeight(20)),
                child: const Text(
                  'Tạo mật khẩu mới',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                child: const Text(
                  'Mật khẩu mới phải khác với mật khẩu cũ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              _textFormField("Nhập mật khẩu mới", (value) {}),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              _textFormField("Xác nhận mật khẩu", (value) {}),
              Container(
                width: getFullWidth(),
                margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                    left: getProportionateScreenWidth(80),
                    right: getProportionateScreenWidth(80)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(20)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.thinBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: AppColor.darkGray),
                      ),
                    ),
                  ),
                  child: Text(
                    "Đổi mật khẩu",
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColor.colorWhite,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
