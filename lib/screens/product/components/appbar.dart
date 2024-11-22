// import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
// import 'package:ecommerce_app_mobile/security_user/change.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart'; 

// class AppbarProduct extends StatefulWidget {
//   AppbarProduct(
//       {super.key, required this.product, required this.scrollController});

//   final ProductDataModel product;
//   ScrollController scrollController;

//   @override
//   State<AppbarProduct> createState() => _AppbarProductState();
// }

// class _AppbarProductState extends State<AppbarProduct> {
//   bool isAppBarCollapsed = false;

//   @override
//   void initState() {
//     super.initState();
//     widget.scrollController.addListener(() {
//       if (widget.scrollController.offset >=
//           (SizeConfig.screenHeight * 0.4 - kToolbarHeight)) {
//         setState(() {
//           isAppBarCollapsed = true;
//         });
//       } else {
//         setState(() {
//           isAppBarCollapsed = false;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     widget.scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: isAppBarCollapsed
//           ? Colors.white
//           : ChangeData.ChangeColorIdToColors(
//               widget.product.productColorId.toString()),
//       expandedHeight: SizeConfig.screenHeight * 0.4,
//       floating: true,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         background:
//             Image.network('${widget.product.imageUrl}', fit: BoxFit.cover),
//       ),
//       title: isAppBarCollapsed
//           ? ImageAppBarAnimate(
//               productColorId: widget.product.productColorId.toString(),
//               isAppBarCollapsed: isAppBarCollapsed,
//               imageUrl: widget.product.imageUrl.toString(),
//             )
//           : const SizedBox(),
//       centerTitle: true,
//       //title: Text('My App Bar'),
//       leading: Container(
//         margin: const EdgeInsets.only(left: 10),
//         padding: const EdgeInsets.only(left: 5),
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//         ),
//         child: IconButton(
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//           color: Colors.black87,
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//       ),
//       leadingWidth: 50,
//       actions: [
//         Container(
//           height: 40,
//           width: 40,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//           child: IconButton(
//             onPressed: () {},
//             color: Colors.black87,
//             icon: const Icon(Icons.share_outlined),
//           ),
//         ),
//         const SizedBox(width: 10),
//         Container(
//           height: 40,
//           width: 40,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//           child: IconButton(
//             onPressed: () {},
//             color: Colors.black87,
//             icon: const Icon(Icons.filter_list_outlined),
//           ),
//         ),
//         const SizedBox(width: 10),
//       ],
//     );
//   }
// }

// class ImageAppBarAnimate extends StatelessWidget {
//   ImageAppBarAnimate(
//       {super.key,
//       required this.productColorId,
//       required this.isAppBarCollapsed,
//       required this.imageUrl});

//   final String productColorId;
//   final String imageUrl;
//   bool isAppBarCollapsed;

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       tween: Tween<double>(
//           begin: isAppBarCollapsed ? 0 : 1, end: isAppBarCollapsed ? 1 : 0),
//       duration: const Duration(milliseconds: 2000),
//       curve: Curves.easeOutQuad,
//       builder: (BuildContext context, double val, Widget? child) {
//         return Opacity(
//           opacity: val,
//           child: child,
//         );
//       },
//       child: Container(
//         height: 45,
//         width: 45,
//         decoration: BoxDecoration(
//           color: ChangeData.ChangeColorIdToColors(productColorId),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Image.network(
//           imageUrl,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
