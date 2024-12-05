import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {super.key,
      required this.isLogin,
      this.username,
      this.isActivate,
      required this.profile});

  final UserDataModel profile;
  final bool isLogin;
  final String? username;
  final bool? isActivate;

  @override
  Widget build(BuildContext context) {
    double avatarHeight = getProportionateScreenHeight(75);
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight + 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          Center(
            child: GestureDetector(
              onTap: () {

              },
              child: Container(
                height: avatarHeight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  /*  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),*/
                ),
                child: profile.images == null
                    ? Image.asset('assets/images/ic_default_avatar.png')
                    : ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(profile.images.toString())),
              ),
            ),
          ),

          space(20),

          // Username
          Text(
            isLogin ? profile.username.toString() : "Đăng nhập / Đăng ký",
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 17, color: Colors.white),
          ),

          space(10),

          // state
          if (isLogin == true)
            Container(
              padding:
                  const EdgeInsets.only(top: 5, right: 30, bottom: 5, left: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFF3B30)),
              child: const Text(
                "Chưa kích hoạt",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget space(double size) {
    return SizedBox(
      height: getProportionateScreenHeight(size),
    );
  }
}
