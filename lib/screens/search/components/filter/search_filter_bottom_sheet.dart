// import 'package:flutter/material.dart';

// import '../../../../size_config.dart';

// class SearchFilterBody extends StatefulWidget {
//   const SearchFilterBody({super.key, required this.filter});

//   final List<Map<String, List<dynamic>>> filter;

//   @override
//   State<SearchFilterBody> createState() => _SearchFilterBodyState();
// }

// class _SearchFilterBodyState extends State<SearchFilterBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: getProportionateScreenHeight(740),
//       child: Column(
//         children: [
//           Container(
//             height: getProportionateScreenWidth(55),
//             width: getFullWidth(),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(width: 1.0, color: Colors.black),
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 'Lọc',
//                 textScaleFactor: 1,
//                 style: TextStyle(
//                   fontFamily: 'SF Pro Text',
//                   fontSize: 22,
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.077,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 3,
//               itemBuilder: (context, index) => Categories(
//                 list: widget.filter[index].values.first,
//                 title: widget.filter[index].keys.first,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
