// import 'package:ecommerce_app_mobile/screens/myprofile/components/container_rad35.dart';
// import 'package:ecommerce_app_mobile/screens/myprofile/components/profile_line.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart'; 

// class Body extends StatelessWidget {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         background(),
//         Column(
//           children: [
//             //ProfileAvatar(isLogin: false, profile: null),

//             Padding(
//               padding: EdgeInsets.only(top: getProportionateScreenHeight(150)),
//               child: const ContainerRad35(
//                 padding: EdgeInsets.only(left: 35.0, right: 35, top: 10),
//                 child: Column(
//                   children: [
//                     ProfileLine(
//                         iconPath: "assets/images/settings.png",
//                         content: "Cài đặt"),
//                     ProfileLine(
//                       iconPath: "assets/images/settings.png",
//                       content: "Về chúng tôi",
//                       isLastElement: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget background() {
//     // Paint.enableDithering = true;
//     return SizedBox(
//       height: getProportionateScreenHeight(312),
//       // height: getProportionateScreenHeight(500),
//       width: getFullWidth(),
//       child: ClipPath(
//           clipper: _BottomCurveClipper(),
//           child: Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.topRight,
//                   colors: [
//                     Color(0xff0b163d),
//                     Color(0xff10235e),
//                     Color(0xff142b76),
//                     Color(0xff18338a),
//                     Color(0xff1d3da7),
//                   ],
//                   // transform: GradientRotation(math.pi * -0.1),
//                   // stops: [0.1, 0.3],
//                 )),
//           )),
//     );
//   }
// }

// class _BottomCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height / 1.2); // Điểm bắt đầu
//     path.quadraticBezierTo(size.width / 2, size.height, size.width,
//         size.height / 1.2); // Đường cong
//     path.lineTo(size.width, 0); // Điểm kết thúc
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
