// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fmp_vendor/components/colors.dart';
// import 'package:fmp_vendor/helper/change.dart';
// import 'package:fmp_vendor/model/vendor_rest_model/vendors/shipping_address_model.dart';
// import 'package:fmp_vendor/screens/product/bloc/product_bloc.dart';
// import 'package:fmp_vendor/screens/product/components/market/full_detail_infomation_product.dart';
// import 'package:fmp_vendor/size_config.dart';
// import 'package:intl/intl.dart';

// class CreateOrderScreen extends StatefulWidget {
//   const CreateOrderScreen({super.key});
//   static String routeName = "/create_order";

//   @override
//   State<CreateOrderScreen> createState() => _CreateOrderScreenState();
// }

// class _CreateOrderScreenState extends State<CreateOrderScreen> {
//   ProductBloc productBloc = ProductBloc();
//   late TextEditingController _controller;
//   late TextEditingController _controllerDateReceive;
//   DateTime? date;
//   int? quantity;
//   bool checkedMethod = true;

//   @override
//   void initState() {
//     _controller = TextEditingController();
//     _controllerDateReceive = TextEditingController();
//     _controller.text = quantity.toString();
//     super.initState();
//   }

//   @override
//   void deactivate() {
//     _controller.dispose();
//     super.deactivate();
//   }

//   @override
//   Widget build(BuildContext context) {
//     productBloc.add(InitialOrderEvent());

//     args model = ModalRoute.of(context)?.settings.arguments as args;
//     quantity ??= model.quantity;
//     _controller.text = quantity.toString();
//     _controllerDateReceive.text =
//         DateFormat('dd/MM/yyyy').format(DateTime.parse(model.dateTo));

//     date ??= DateTime.parse(model.dateTo);

//     void increase() {
//       if (quantity! < model.maxQ) {
//         setState(() {
//           quantity = quantity! + 1;
//         });
//       }
//     }

//     void decrease() {
//       if (quantity! > model.minQ) {
//         setState(() {
//           quantity = quantity! - 1;
//         });
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Thanh toán',
//           style: TextStyle(
//               fontWeight: FontWeight.w600, color: AppColor.colorBlack),
//         ),
//         elevation: 0.5,
//       ),
//       body: BlocConsumer<ProductBloc, ProductState>(
//         bloc: productBloc,
//         listenWhen: (previous, current) => current is ProductActionState,
//         listener: (context, state) {
//           if (state is CreateOrderActionState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text(
//                   'Tạo đơn hàng thành công!',
//                   textScaleFactor: 1,
//                 ),
//               ),
//             );
//             Future.delayed(const Duration(milliseconds: 1000), () {
//               Navigator.pop(context);
//             });
//           } else if (state is CreateOrderErrorActionState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text(
//                   'Tạo đơn hàng thất bại!',
//                   textScaleFactor: 1,
//                 ),
//               ),
//             );
//           }
//         },
//         buildWhen: (previous, current) => current is! ProductActionState,
//         builder: (context, state) {
//           if (state is ProductInitial) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is InitialOrderActionState) {
//             var successState = state;
//             VendorShippingAddressData? defaultAddress = successState.address;
//             return SingleChildScrollView(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Địa chỉ nhận hàng',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w700),
//                         ),
//                         TextButton(
//                             onPressed: null,
//                             child: Text(
//                               'Thêm địa chỉ',
//                               style: TextStyle(
//                                   fontSize: 16, color: AppColor.colorBlack),
//                             ))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Text(
//                         'Cửa hàng',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: AppColor.darkGray),
//                       ),
//                     ),
//                     Container(
//                       width: getFullWidth(),
//                       color: AppColor.colorWhite,
//                       alignment: AlignmentDirectional.topCenter,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           rowDetailAddress(
//                               Icon(
//                                 Icons.location_on_outlined,
//                                 color: AppColor.colorF97616,
//                                 size: 20,
//                               ),
//                               defaultAddress != null
//                                   ? "${defaultAddress.addressStreet}/${defaultAddress.addressWardName}/${defaultAddress.addressDistrictName}/${defaultAddress.addressCityName}/${defaultAddress.addressCityName}"
//                                   : "Invalid",
//                               const SizedBox()),
//                           rowDetailAddress(
//                               SvgPicture.asset(
//                                 'assets/images/IC_Person.svg',
//                                 height: 20,
//                                 color: AppColor.colorF97616,
//                               ),
//                               defaultAddress != null
//                                   ? defaultAddress.name!
//                                   : "Invalid",
//                               const Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 size: 24,
//                               )),
//                           rowDetailAddress(
//                               Icon(
//                                 Icons.phone_outlined,
//                                 color: AppColor.colorF97616,
//                                 size: 20,
//                               ),
//                               defaultAddress != null
//                                   ? defaultAddress.phone!
//                                   : "Invalid",
//                               const SizedBox()),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 image: const DecorationImage(
//                                     image: NetworkImage(
//                                         "https://firebasestorage.googleapis.com/v0/b/admin-fmp-storage.appspot.com/o/images%2Fproduct%2Fh8.jpg0af12498-6fb1-4ccd-a8d7-c70e10cc742d?alt=media&token=b1cd0b51-08fe-4fc7-b093-779c5975fd28"),
//                                     fit: BoxFit.cover)),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                             child: SizedBox(
//                               height: 80,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Cúc trắng",
//                                         textScaleFactor: 1,
//                                         softWrap: true,
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                             letterSpacing: -0.8,
//                                             wordSpacing: -0.5,
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w600,
//                                             color: AppColor.colorBlack),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         ChangeData.changeStringToCurrency(
//                                             model.price.toString()),
//                                         textScaleFactor: 1,
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w600,
//                                             color: AppColor.darkGray),
//                                       ),
//                                       const Spacer(),
//                                       Container(
//                                         height: 32,
//                                         width: 32,
//                                         alignment: Alignment.center,
//                                         child: OutlinedButton(
//                                           style: ButtonStyle(
//                                             padding:
//                                                 const MaterialStatePropertyAll(
//                                                     EdgeInsets.all(0)),
//                                             shape: MaterialStatePropertyAll(
//                                               RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                               ),
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             decrease();
//                                             _controller.text =
//                                                 quantity.toString();
//                                           },
//                                           child: Text(
//                                             '-',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w900,
//                                                 color: AppColor.colorBlack,
//                                                 fontSize: 20),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 32,
//                                         width: 70,
//                                         child: TextField(
//                                           keyboardType: TextInputType.number,
//                                           textAlign: TextAlign.center,
//                                           decoration: InputDecoration(
//                                             contentPadding:
//                                                 const EdgeInsets.all(5),
//                                             enabledBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   width: 0,
//                                                   color: AppColor.colorWhite),
//                                             ),
//                                             focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   width: 0,
//                                                   color: AppColor.colorWhite),
//                                             ),
//                                             border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   width: 0,
//                                                   color: AppColor.colorWhite),
//                                             ),
//                                           ),
//                                           controller: _controller,
//                                           style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600),
//                                           onChanged: (value) {
//                                             setState(() {
//                                               try {
//                                                 quantity = int.parse(value);
//                                                 if (quantity! < model.minQ) {
//                                                   _controller.text =
//                                                       model.minQ.toString();
//                                                   quantity = model.minQ;
//                                                 }
//                                                 if (quantity! > model.maxQ) {
//                                                   _controller.text =
//                                                       model.maxQ.toString();
//                                                   quantity = model.maxQ;
//                                                 }
//                                               } catch (e) {
//                                                 _controller.text =
//                                                     model.minQ.toString();
//                                                 quantity = model.minQ;
//                                               }
//                                             });
//                                           },
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 32,
//                                         width: 32,
//                                         alignment: Alignment.center,
//                                         child: OutlinedButton(
//                                           style: ButtonStyle(
//                                             padding:
//                                                 const MaterialStatePropertyAll(
//                                                     EdgeInsets.all(0)),
//                                             shape: MaterialStatePropertyAll(
//                                               RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                               ),
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             increase();
//                                             _controller.text =
//                                                 quantity.toString();
//                                           },
//                                           child: Text(
//                                             '+',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.w900,
//                                                 color: AppColor.colorBlack,
//                                                 fontSize: 20),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Text(
//                       'Phương thức vận chuyển',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         children: [
//                           const Text('Self'),
//                           Checkbox(
//                             value: checkedMethod,
//                             onChanged: (newValue) {
//                               setState(() {
//                                 checkedMethod = newValue!;
//                               });
//                             },
//                           ),
//                           const Expanded(
//                               child: Text(
//                             'Lansium',
//                             textAlign: TextAlign.right,
//                           )),
//                           Checkbox(
//                             value: !checkedMethod,
//                             onChanged: (newValue) {
//                               setState(() {
//                                 checkedMethod = !newValue!;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Text(
//                       'Ngày nhận hàng',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: TextField(
//                         onTap: () async {
//                           DateTime? d = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime.parse(model.dateFrom),
//                               lastDate: DateTime.parse(model.dateTo));
//                           if (d != null) {
//                             _controllerDateReceive.text =
//                                 DateFormat("dd/MM/yyyy").format(d!);
//                             date = d;
//                           }
//                         },
//                         style: const TextStyle(fontSize: 15),
//                         readOnly: true,
//                         controller: _controllerDateReceive,
//                         keyboardType: TextInputType.datetime,
//                         decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 20),
//                             suffixIcon: Icon(Icons.calendar_month_rounded)),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 20, bottom: 10),
//                       child: Text(
//                         'Hoá đơn',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                     rowDetailReceipt('Số lượng sản phẩm', "$quantity sản phẩm"),
//                     rowDetailReceipt(
//                         'Giá',
//                         ChangeData.changeStringToCurrency(
//                             (quantity! * model.price).toString())),
//                     checkedMethod == false
//                         ? rowDetailReceipt('Phí vận chuyển', '20.000 đ')
//                         : SizedBox(),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, bottom: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "Tổng đơn",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColor.colorBlack),
//                             ),
//                           ),
//                           const Expanded(
//                               child: Text(
//                             "20.000 đ",
//                             textAlign: TextAlign.end,
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.w600),
//                           ))
//                         ],
//                       ),
//                     ),
//                     Divider(
//                       color: AppColor.colorBlack,
//                       thickness: 0.25,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             minimumSize: const Size.fromHeight(50),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20))),
//                         onPressed: () {
//                           productBloc.add(CreateOrderEvent(
//                               demandId: model.demandId,
//                               productQuantity: quantity!,
//                               transportMethod:
//                                   checkedMethod ? "self" : "lansium",
//                               requireDeliveryTimeTo: date!));
//                         },
//                         child: const Text(
//                           'Xác nhận',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           } else if (state is ProductErrorState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text(
//                   'Tạo đơn hàng thất bại!',
//                   textScaleFactor: 1,
//                 ),
//               ),
//             );
//             return const SizedBox();
//           } else {
//             return const SizedBox();
//           }
//         },
//       ),
//     );
//   }

//   Padding rowDetailReceipt(String lable, String val) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               lable,
//               style: TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                   color: AppColor.darkGray),
//             ),
//           ),
//           Expanded(
//               child: Text(
//             val,
//             textAlign: TextAlign.end,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ))
//         ],
//       ),
//     );
//   }

//   Widget rowDetailAddress(Widget icon, String detail, icon2) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           icon,
//           const SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: Text(
//               detail,
//               textScaleFactor: 1,
//               maxLines: 2,
//               style: TextStyle(
//                   overflow: TextOverflow.visible,
//                   color: AppColor.colorBlack,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           icon2
//         ],
//       ),
//     );
//   }
// }
