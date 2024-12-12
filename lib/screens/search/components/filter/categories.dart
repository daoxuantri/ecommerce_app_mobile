// import 'package:ecommerce_app_mobile/model/home/products/products.dart';
// import 'package:flutter/material.dart';
// import '../../../../size_config.dart';

// class Categories extends StatefulWidget {
//   const Categories({super.key, required this.list, required this.title});

//   final String title;
//   final List<dynamic> list;

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     List<ProductColorsDataModel> listColors = [];
//     List<ProductDataModel> listProducts = [];
//     List<ProductCategoryDataModel> listCategories = [];

//     if (widget.title == "Màu sắc") {
//       listColors = widget.list as List<ProductColorsDataModel>;
//     } else if (widget.title == "Xuất xứ") {
//       listProducts = widget.list as List<ProductDataModel>;
//     } else {
//       listCategories = widget.list as List<ProductCategoryDataModel>;
//     }
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
//       child: Container(
//         decoration: BoxDecoration(
//             border:
//                 Border(bottom: BorderSide(width: 1.0, color: Colors.black))),
//         child: ExpansionTile(
//           title: Text(widget.title),
//           childrenPadding:
//               EdgeInsets.only(left: getProportionateScreenWidth(10)),
//           children: List.generate(
//             widget.list.length,
//             (index) => Column(
//               children: [
//                 ListTile(
//                   title: Text(widget.title == "Màu sắc"
//                       ? listColors[index].name.toString()
//                       : widget.title == "Xuất xứ"
//                           ? listProducts[index].countryId.toString()
//                           : listCategories[index].name.toString()),
//                   onTap: () {},
//                 ),
//                 Divider(
//                   height: getProportionateScreenHeight(1),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
