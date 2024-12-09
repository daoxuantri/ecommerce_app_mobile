import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/screens/user_information/bloc/user_infomation_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class EditUserInfoBody extends StatefulWidget {
  const EditUserInfoBody(
      {super.key, required this.infoBloc, required this.profile});

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
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  late UserDataModel updateProfile;

  int initDataCount = 0;
  var isNullAddress = false;
  double paddingTopItemNum = 20;
  String kPasswordNullError = "Mật khẩu không được để trống";
  String kRePasswordNullError = "Xác nhận mật khẩu không được để trống";
  bool _isNewPasswordVisible = false;
  bool _isRePasswordVisible = false;

  @override
  void initState() {
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
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: const Text(
          "Thông tin cá nhân",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: getFullWidth(),
        height: getFullHeight(),
        color: AppColor.colorE8E8F4,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildEditItem(
                      "Tên người dùng",
                      _nameController,
                      kNamelNullError,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8),
                    ),
                    _buildEditItem(
                      "Email",
                      _emailController,
                      kEmailNullError,
                      isEditable:
                          false, // Đặt thành false để làm cho nó chỉ đọc
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8),
                    ),
                    _buildEditItem(
                      "Mật khẩu mới",
                      _newPasswordController,
                      kPasswordNullError,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8),
                    ),
                    _buildEditItem(
                      "Xác nhận mật khẩu",
                      _rePasswordController,
                      kRePasswordNullError,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                  ],
                ),
              ),
            ),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditItem(
      String title, TextEditingController controller, String keyError,
      {bool isEditable = true}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return keyError;
                }

                // Kiểm tra mật khẩu xác nhận
                if (title == "Xác nhận mật khẩu") {
                  if (value != _newPasswordController.text) {
                    return "Mật khẩu xác nhận không khớp";
                  }
                }

                return null;
              },
              obscureText:
                  (title == "Mật khẩu mới" || title == "Xác nhận mật khẩu") &&
                      (title == "Mật khẩu mới"
                          ? !_isNewPasswordVisible
                          : !_isRePasswordVisible),
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1, color: AppColor.colorF97616),
                ),
                suffixIcon: (title == "Mật khẩu mới" ||
                        title == "Xác nhận mật khẩu")
                    ? IconButton(
                        icon: Icon(
                          (title == "Mật khẩu mới"
                              ? (_isNewPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)
                              : (_isRePasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        onPressed: () {
                          setState(() {
                            if (title == "Mật khẩu mới") {
                              _isNewPasswordVisible = !_isNewPasswordVisible;
                            } else {
                              _isRePasswordVisible = !_isRePasswordVisible;
                            }
                          });
                        },
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0), 
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
          String newPassword = _newPasswordController.text;
          String rePassword = _rePasswordController.text;

          if (newPassword != rePassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Mật khẩu và xác nhận mật khẩu không khớp"),
                backgroundColor: Colors.red,
              ),
            );
            return; 
          }
          widget.infoBloc.add(ResetPassEventClickEvent(newPassword, updateProfile.email!));


        }
        },
        child: Text(
          'Cập nhật',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.colorFF3B30),
          minimumSize: MaterialStateProperty.all(Size(
            getProportionateScreenWidth(100),
            getProportionateScreenHeight(45), // Điều chỉnh chiều cao nếu cần
          )),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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
