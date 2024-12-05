// import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';

// class Post extends StatefulWidget {
//   const Post({super.key});

//   @override
//   _PostState createState() => _PostState();
// }

// class _PostState extends State<Post> {
//   List<String> tabs = [
//     "Mua 4",
//     "Bán 0",
//     "Đang mở 0",
//     "Đã đóng 0",
//     "Đã hết 0",
//   ];
//   int current = 0;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     ScrollController scrollController = ScrollController();
//     var itemWidth = 140;
//     var containerWidth = size.width;
//     return Column(
//       children: [
//         // horizontal tab list
//         Container(
//           margin: const EdgeInsets.only(top: 15),
//           width: size.width,
//           height: size.height * 0.05,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: size.height * 0.0485,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   height: 1,
//                   color: Colors.black,
//                   width: size.width,
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: SizedBox(
//                   width: size.width,
//                   height: size.height * 0.05,
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     physics: const BouncingScrollPhysics(),
//                     controller: scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: tabs.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding:
//                             EdgeInsets.only(left: index == 0 ? 0 : 0, top: 10),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               current = index;
//                             });
//                             scrollController.animateTo(
//                               index == 0
//                                   ? scrollController.position.minScrollExtent
//                                   : index == tabs.length - 1
//                                       ? scrollController
//                                           .position.maxScrollExtent
//                                       : index * itemWidth -
//                                           containerWidth / 2 +
//                                           itemWidth / 2,
//                               duration: const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           },
//                           child: Container(
//                             color: Colors.transparent,
//                             width: getProportionateScreenWidth(150),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   tabs[index],
//                                   style: TextStyle(
//                                     color: current == index
//                                         ? AppColor.colorF97616
//                                         : Colors.black,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 AnimatedPositioned(
//                                   curve: Curves.fastLinearToSlowEaseIn,
//                                   bottom: 0,
//                                   //left: changePositionedOfLine(),
//                                   duration: const Duration(milliseconds: 500),
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 500),
//                                     curve: Curves.fastLinearToSlowEaseIn,
//                                     width: current == index
//                                         ? getProportionateScreenWidth(150)
//                                         : getProportionateScreenWidth(150),
//                                     height: 1,
//                                     decoration: BoxDecoration(
//                                       color: current == index
//                                           ? AppColor.colorF97616
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // tab content
//         _getSelectedTab(current, size)
//       ],
//     );
//   }
//   Widget _getSelectedTab(int current, Size size) {
//     switch (current) {
//       case 0:
//         return _MuaTab(size);
//       case 1:
//         return _BanTab(size);
//       case 2:
//         return _DangMoTab(size);
//       case 3:
//         return _DangDongTab(size);
//       default:
//         return _DaHetTab(size);
//     }
//   }


//   Widget _MuaTab(Size size) {
//     return Column(
//       children: [_searchBox(size),
//         _gridProduct(size)],
//     );
//   }

//   Widget _BanTab(Size size) {
//     return Column(
//       children: [_searchBox(size), _noItemFound()],
//     );
//   }

//   Widget _DangMoTab(Size size) {
//     return Column(
//       children: [_searchBox(size), _noItemFound()],
//     );
//   }

//   Widget _DangDongTab(Size size) {
//     return Column(
//       children: [_searchBox(size), _noItemFound()],
//     );
//   }

//   Widget _DaHetTab(Size size) {
//     return Column(
//       children: [_searchBox(size), _noItemFound()],
//     );
//   }

//   Widget _searchBox(Size size) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15.0),
//       child: Center(
//         child: SizedBox(
//           width: size.width - 40,
//           height: getProportionateScreenHeight(80),
//           child: const TextField(
//             style: TextStyle(fontSize: 16),
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.search),
//               hintText: 'Tìm kiếm...',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _gridProduct(Size size) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: SizedBox(
//         width: size.width,
//         // height: size.height,
//         child: GridView.count(
//           physics: const NeverScrollableScrollPhysics(),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 20,
//           childAspectRatio: 0.85,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           shrinkWrap: true,
//           crossAxisCount: 2,
//           children: [
//             // Các widget con trong GridView
//             _productContainer(size),
//             _productContainer(size),
//             _productContainer(size),
//             _productContainer(size),
//           ],
//         ),
//       ),
//     );

//   }

//   Widget _productContainer(Size size) {
//     return Container(
//       height: 250,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(15),
//             ),
//             child: Image.asset(
//               'assets/images/Product03.png',
//               fit: BoxFit.fill,
//               height: 130,
//               width: 200,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Hoa loa kèn",
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Giá",
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 1,
//                           ),
//                           Text(
//                             "124.256đ",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 25,
//                         width: 25,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.green,
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "A",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       //const SizedBox(width: 20,)
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _noItemFound() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 40.0),
//       child: Center(
//         child: Column(
//           children: [
//             Image.asset(
//               "assets/images/img_no_item_found.png",
//               height: 100,
//               width: 100,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(28.0),
//               child: Text(
//                 "Không tìm thấy kết quả",
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
