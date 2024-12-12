// import 'package:flutter/material.dart';
// import '../../../../size_config.dart';

// class SearchFilterButton extends StatefulWidget {
//   const SearchFilterButton({super.key, required this.filter});

//   final List<Map<String, List<dynamic>>> filter;

//   @override
//   State<SearchFilterButton> createState() => _SearchFilterButtonState();
// }

// class _SearchFilterButtonState extends State<SearchFilterButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: getProportionateScreenHeight(20),
//       right: getProportionateScreenWidth(32),
//       child: GestureDetector(
//         onTap: () {
//           _searchFilterBottomSheet(context,widget.filter);
//         },
//         child: Container(
//             width: getProportionateScreenWidth(100),
//             height: getProportionateScreenHeight(50),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 color: AppColor.color35A5F1),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: getProportionateScreenWidth(17),
//                 ),
//                 Image.asset(
//                   "assets/images/filter_svgrepo.com.png",
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(9),
//                 ),
//                 Text(
//                   'Lọc',
//                   textScaleFactor: 1,
//                   style: TextStyle(
//                       fontFamily: 'SF Pro Text',
//                       fontSize: 15,
//                       fontStyle: FontStyle.normal,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: -0.051,
//                       color: Colors.white),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

// Future _searchFilterBottomSheet(BuildContext context, List<Map<String, List<dynamic>>> filter) {
//   return showModalBottomSheet(
//     isScrollControlled: true,
//     context: context,
//     builder: (context) => SearchFilterBody(filter: filter,),
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
//   );
// }
