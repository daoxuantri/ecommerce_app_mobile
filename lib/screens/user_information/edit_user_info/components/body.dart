
import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/screens/user_information/bloc/user_infomation_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class EditUserInfoBody extends StatefulWidget {
  const EditUserInfoBody(
      {super.key,
      required this.infoBloc,
      required this.profile });

  final UserInformationBloc infoBloc;
  final UserDataModel profile;

  @override
  State<EditUserInfoBody> createState() => _EditUserInfoBodyState();
}

class _EditUserInfoBodyState extends State<EditUserInfoBody> {
  final _formKey = GlobalKey<FormState>();

  // text controller to get data from text field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


  late UserDataModel updateProfile;

  int initDataCount = 0;
  var isNullAddress = false;
  double paddingTopItemNum = 20;

  @override
  void initState() {
    // _initData();
    updateProfile = widget.profile;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  if (initDataCount < 2) {
    _initData();
    initDataCount++;
  }

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      title: const Text(
        "Thông tin cá nhân",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
    body: Stack(
      children: [
        Container(
          width: getFullWidth(),
          height: getFullHeight(),
          color: AppColor.colorE8E8F4,
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20, right: 20),
          margin: const EdgeInsets.only(top: 20, bottom: 90),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildEditItem(
                      "Tên người dùng",
                      _nameController,
                      kNamelNullError,
                    ),
                    _buildEditItem(
                      "Email",
                      _emailController,
                      kEmailNullError,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(bottom: 0, left: 0, right: 0, child: _buildUpdateButton()),
      ],
    ),
  );
}

  Widget _buildEditItem(
      String title, TextEditingController controller, String keyError) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTopItemNum),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return keyError;
                }

                // check valid email
                if (keyError == kEmailNullError) {
                  if (!emailValidatorRegExp.hasMatch(value)) {
                    return kInvalidEmailError;
                  }
                }

                // check valid phone number
                if (keyError == kPhoneNumberNullError) {
                  if (!phoneValidatorRegExp.hasMatch(value)) {
                    return kInvalidPhoneNumberError;
                  }
                }
                return null;
              },
              keyboardType: keyError == kEmailNullError
                  ? TextInputType.emailAddress
                  : keyError == kPhoneNumberNullError
                      ? TextInputType.number
                      : null,
              controller: controller,
              decoration: InputDecoration(
                //filled: true,
                //fillColor: Colors.grey[200],
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1, color: AppColor.colorF97616),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  

  Widget _buildUpdateButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          String name = _nameController.text;
          String email = _emailController.text;

          widget.infoBloc.add(UserInfoUpdateEvent(updateProfile));
        }
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xff0a84ff),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            'Lưu thay đổi',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _initData() {
  var profile = widget.profile;

  if (profile.username != null) {
    _nameController.text = profile.username.toString();
  }
  
  if (profile.email != null) {
    _emailController.text = profile.email.toString();
  }
}
}

  
