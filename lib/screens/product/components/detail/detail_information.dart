// import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart'; 

// class DetailInformation extends StatefulWidget {
//   const DetailInformation({super.key, required this.product});

//   final ProductDataModel product;

//   @override
//   State<DetailInformation> createState() => _DetailInformationState();
// }

// class _DetailInformationState extends State<DetailInformation> {
//   final ProductBloc _productSubBlocBloc = ProductBloc();
//   var quantityProduct = 1;
//   List<RadioModel> sampleData = <RadioModel>[];

//   @override
//   void initState() {
//     super.initState();
//     _productSubBlocBloc
//         .add(ProductSubInitialEvent(productId: widget.product.id.toString()));
//     sampleData.add(RadioModel(false, 'A'));
//     sampleData.add(RadioModel(false, 'B'));
//     sampleData.add(RadioModel(false, 'C'));
//     sampleData.add(RadioModel(false, 'D'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                   horizontal: SizeConfig.screenWidth * 0.05),
//               margin: const EdgeInsets.only(bottom: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       '${widget.product.name}',
//                       textScaleFactor: 1,
//                       style: const TextStyle(
//                         overflow: TextOverflow.ellipsis,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: ChangeData.ChangeColorIdToColors(
//                             widget.product.productColorId.toString())),
//                   ),
//                   const Spacer(),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     child: BlocBuilder<ProductBloc, ProductState>(
//                       bloc: _productSubBlocBloc,
//                       buildWhen: (previous, current) =>
//                           current is ProductSubState,
//                       builder: (context, state) {
//                         switch (state.runtimeType) {
//                           case ProductSubSuccess:
//                             final successState = state as ProductSubSuccess;
//                             return GestureDetector(
//                               onTap: () {
//                                 _productSubBlocBloc.add(
//                                     ProductClickedFavoriteEvent(
//                                         successState.check,
//                                         productId: '${widget.product.id}'));
//                               },
//                               child: Container(
//                                 width: 50,
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                   color: successState.check
//                                       ? Colors.pinkAccent
//                                       : const Color(0xFFD1D1D6),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(50)),
//                                   border: Border.all(
//                                     color: Colors.white,
//                                     width: 2,
//                                   ),
//                                 ),
//                                 child: const Center(
//                                     child: Icon(
//                                   Icons.favorite_sharp,
//                                   color: Colors.white,
//                                   size: 30,
//                                   weight: 1,
//                                 )),
//                               ),
//                             );
//                           default:
//                             return Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(10)),
//                                 border: Border.all(
//                                   color: Colors.black,
//                                   width: 2,
//                                 ),
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   Icons.favorite_border_outlined,
//                                   color: Colors.black,
//                                   size: 30,
//                                   weight: 1,
//                                 ),
//                               ),
//                             );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.screenWidth * 0.05),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text.rich(
//                           TextSpan(
//                             text: 'Danh mục: ',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             children: [
//                               TextSpan(
//                                   text: '${widget.product.categoryName}',
//                                   style: const TextStyle(
//                                       overflow: TextOverflow.ellipsis,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.normal))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Text.rich(
//                           TextSpan(
//                             text: 'Xuất xứ: ',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             children: [
//                               TextSpan(
//                                   text: ChangeData.ChangeCountry(
//                                       widget.product.countryId.toString()),
//                                   style: const TextStyle(
//                                       overflow: TextOverflow.ellipsis,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.normal))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.screenWidth * 0.05),
//                   margin: const EdgeInsets.only(top: 10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Row(
//                           children: [
//                             const Flexible(
//                               flex: 1,
//                               child: Text(
//                                 'Phí dịch vụ: ',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                                 flex: 1,
//                                 child: Text(
//                                   '${widget.product.commissionValuePercent} %',
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RadioModel {
//   bool isSelected;
//   final String buttonText;

//   RadioModel(this.isSelected, this.buttonText);
// }

// class RadioItem extends StatelessWidget {
//   final RadioModel _item;
//   RadioItem(this._item);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 35,
//       height: 35,
//       margin: const EdgeInsets.only(right: 10),
//       decoration: BoxDecoration(
//           color: _item.isSelected
//               ? displayColor(_item.buttonText)
//               : const Color(0xFFD1D1D6),
//           shape: BoxShape.circle),
//       child: Center(
//           child: Text(_item.buttonText,
//               style: const TextStyle(color: Colors.white, fontSize: 20))),
//     );
//   }

//   Color displayColor(String buttonText) {
//     return buttonText == 'A'
//         ? const Color(0xFFE3B98F)
//         : buttonText == 'B'
//             ? const Color(0XFFBEE8E6)
//             : buttonText == 'C'
//                 ? const Color(0xFFF68F8F)
//                 : const Color(0xFF8FD3FE);
//   }
// }
