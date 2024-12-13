import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/components/avatar.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/components/container_rad35.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/components/profile_line.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/logged_in/components/account_post_info.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../login_register/login/login_screen.dart';
import '../../bloc/profile_bloc.dart';

class BodySuccess extends StatelessWidget {
  const BodySuccess(
      {super.key, required this.profile, required this.profileBloc});

  final UserDataModel profile;
  final ProfileBloc profileBloc;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            background(),
            _logoutButton(context),
            Column(
              children: [
                ProfileAvatar(isLogin: true, profile: profile),

                // Account Post Info
                 Padding(
                  padding: EdgeInsets.only(top: 27.0),
                  child: AccountPostInfo(
                      profile: profile),
                ),
                SizedBox(height: getProportionateScreenHeight(45),),

                // Account option
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ContainerRad35(
                    padding:
                        const EdgeInsets.only(left: 35.0, right: 35, top: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            profileBloc.add(
                                ProfileToUserInformationScreenEvent(profile));
                          },
                          child: const ProfileLine(
                              iconPath: "assets/images/IC_Information.png",
                              content: "Thông tin cá nhân"),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     profileBloc.add(ProfileToWalletScreenEvent());
                        //   },
                        //   child: const ProfileLine(
                        //       iconPath: "assets/images/IC_Wallet.png",
                        //       content: "Ví của tôi"),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     profileBloc.add(ProfileToFavouriteEvent());
                        //   },
                        //   child: const ProfileLine(
                        //       iconPath: "assets/images/IC_Start.png",
                        //       content: "Mục yêu thích"),
                        // ),
                        GestureDetector(
                          onTap: () {
                            profileBloc.add(ProfileToMyOrdersScreenEvent());
                          },
                          child: const ProfileLine(
                              iconPath: "assets/images/IC_Order.png",
                              content: "Đơn hàng của tôi"),
                        ),
                        GestureDetector(
                          onTap: () {
                            profileBloc.add(ProfileToAddressScreenEvent());
                          },
                          child: const ProfileLine(
                            iconPath: "assets/images/IC_Pin.png",
                            content: "Địa chỉ nhận hàng",
                            isLastElement: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0),
                //   child: ContainerRad35(
                //     padding:
                //         const EdgeInsets.only(left: 35.0, right: 35, top: 10),
                //     child: Column(
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             profileBloc.add(ProfileToSettingScreenEvent());
                //           },
                //           child: const ProfileLine(
                //               iconPath: "assets/images/settings.png",
                //               content: "Cài đặt"),
                //         ),
                //         const ProfileLine(
                //           iconPath: "assets/images/settings.png",
                //           content: "Về chúng tôi",
                //           isLastElement: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // SizedBox(
                //   height: getProportionateScreenHeight(100),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget background() {
    // Paint.enableDithering = true;
    return SizedBox(
      height: getProportionateScreenHeight(280),
      // height: getProportionateScreenHeight(500),
      width: getFullWidth(),
      child: ClipPath(
          clipper: _BottomCurveClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff7f0b0b),  
                Color(0xff990d0d), 
                Color(0xffb30f0f),  
                Color(0xffcc1111), 
                Color(0xffe61919),  

              ],
              // transform: GradientRotation(math.pi * -0.1),
              // stops: [0.1, 0.3],
            )),
          )),
    );
  }

  _logoutButton(BuildContext context) {
    return Positioned(
      right: 10,
      top: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
        child: Image.asset(
          "assets/images/log_out.png",
          width: 30,
        ),
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 1.2); // Điểm bắt đầu
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height / 1.2); // Đường cong
    path.lineTo(size.width, 0); // Điểm kết thúc
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
