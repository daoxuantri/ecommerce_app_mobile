// import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyEndDrawer extends StatelessWidget {
//   const MyEndDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // thay đổi màu status bar
//     /* SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.white, // Change the status bar color here
//         statusBarBrightness: Brightness
//             .dark, // Define the brightness of the status bar content (e.g., dark or light)
//       ),
//     );*/

//     Size screenSize = MediaQuery.of(context).size;

//     return SafeArea(
//       child: SizedBox(
//         //width: getProportionateScreenWidth(262),
//         width: MediaQuery.of(context).size.width,
//         child: Drawer(
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 // Custom App bar
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           icon: const Icon(
//                             Icons.arrow_back_ios_outlined,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                       const Text(
//                         "More",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 25),
//                       ),
//                       SizedBox(
//                         width: getProportionateScreenWidth(50),
//                       ),
//                     ],
//                   ),
//                 ),

//                 line(screenSize.width),

//                 // Log out
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: ListTile(
//                       contentPadding: EdgeInsets.zero,
//                       minLeadingWidth: 10,
//                       title: Text(
//                         "Đăng xuất",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.colorFF3B30,
//                         ),
//                       ),
//                       onTap: () {

//                       }),
//                 ),

//                 // const _CustomListTile(
//                 //   icon: Icons.home,
//                 //   text: "Tin đăng",
//                 //   widget: StoreInfo(),
//                 // ),
//                 // const _CustomListTile(
//                 //   icon: Icons.event_note_outlined,
//                 //   text: "Thông tin cửa hàng",
//                 //   widget: StoreInfo(),
//                 // ),
//                 // const _CustomListTile(
//                 //   icon: Icons.pin_drop_outlined,
//                 //   text: "Địa chỉ nhận hàng",
//                 //   widget: DeliveryAddress(),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget line(double screenWidth) {
//     return Container(
//       width: screenWidth,
//       height: 1,
//       color: Colors.grey,
//     );
//   }
// }

// class _CustomListTile extends StatelessWidget {
//   const _CustomListTile({
//     required this.icon,
//     required this.text,
//     required this.widget,
//   });

//   final IconData icon;
//   final String text;
//   final Widget widget;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: ListTile(
//           contentPadding: EdgeInsets.zero,
//           minLeadingWidth: 10,
//           trailing: const Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.black,
//             size: 15,
//           ),
//           title: Text(
//             text,
//             style: const TextStyle(
//               fontSize: 15,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => widget),
//             );
//           }),
//     );
//   }
// }
