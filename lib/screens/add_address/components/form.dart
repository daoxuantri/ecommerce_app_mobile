// import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
// import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
// import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
// import 'package:ecommerce_app_mobile/screens/add_address/add_address_screen.dart';
// import 'package:ecommerce_app_mobile/screens/add_address/bloc/add_address_bloc.dart';
// import 'package:ecommerce_app_mobile/screens/add_address/bloc/add_address_event.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../size_config.dart';

// class FormNewAddress extends StatefulWidget {
//   const FormNewAddress({
//     super.key,
//     required this.addAddressBloc,
//     required this.listCity,
//     required this.listDistrict,
//     required this.listWard,
//   });

//   final AddAddressBloc addAddressBloc;
//   static final List<int> checkErr=[0,0,0,0,0,0];
//   final List<CitiData> listCity;
//   final List<DistrictData> listDistrict;
//   final List<WardData> listWard;
//   static final List<String> listValue = ['', '', '', '', '', '', ''];

//   @override
//   State<FormNewAddress> createState() => _FormFormNewAddressState();
// }

// class _FormFormNewAddressState extends State<FormNewAddress> {
//   late CitiData cityselectedValue;
//   late DistrictData districtselectedValue;
//   late WardData wardselectedValue;

//   @override
//   void initState() {
//     super.initState();
//     widget.listCity.insert(0, CitiData(provinceId: '0', provinceName: 'Chọn thành phố'));
//       cityselectedValue = widget.listCity[0];
//       districtselectedValue = widget.listDistrict[0];
//       wardselectedValue = widget.listWard[0];
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Chọn thành phố',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//             fontFamily: 'SF Pro Display',
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(8),
//         ),
//         Container(
//           width: getProportionateScreenWidth(336),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Align(
//               alignment: Alignment.centerLeft,
//               child: InputDecorator(
//                 decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0x42111113))),
//                   contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   errorText: FormNewAddress.checkErr[0] == 1
//                       ? 'Vui lòng chọn thành phố'
//                       : null,
//                 ),
//                 child: DropdownButton(
//                   iconSize: 35,
//                   isDense: false,
//                   underline: const SizedBox(),
//                   value: cityselectedValue,
//                   items: widget.listCity
//                       .map<DropdownMenuItem<CitiData>>((CitiData value) {
//                     return DropdownMenuItem(
//                         value: value,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                           child: Text(
//                             value.provinceName.toString(),
//                           ),
//                         ));
//                   }).toList(),
//                   onChanged: (value) {
//                     FormNewAddress.listValue[0] = value!.toString();
//                     cityselectedValue = value!;
//                     AddAddressScreen.cityName = value;
//                     widget.addAddressBloc
//                         .add(AddAddressCheckInputEvent(0, FormNewAddress.checkErr));
//                     widget.addAddressBloc.add(
//                         AddAddressAfterSeclectedCityEvent(value.provinceId.toString()));
//                   },
//                   isExpanded: true,
//                   style: const TextStyle(
//                     color: Color.fromRGBO(17, 17, 19, 0.6),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontStyle: FontStyle.normal,
//                     fontFamily: 'SF Pro Display',
//                   ),
//                 ),
//               )),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(10),
//         ),
//         const Text(
//           'Chọn huyện',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//             fontFamily: 'SF Pro Display',
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(8),
//         ),
//         Container(
//           width: getProportionateScreenWidth(336),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Align(
//               alignment: Alignment.centerLeft,
//               child: InputDecorator(
//                 decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0x42111113))),
//                   contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   errorText:
//                   FormNewAddress.checkErr[1] == 1 ? 'Vui lòng chọn huyện' : null,
//                 ),
//                 child: DropdownButton(
//                   iconSize: 35,
//                   isDense: false,
//                   underline: const SizedBox(),
//                   value: districtselectedValue,
//                   items: widget.listDistrict
//                       .map<DropdownMenuItem<DistrictData>>(
//                           (DistrictData value) {
//                     return DropdownMenuItem(
//                         value: value,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                           child: Text(
//                             value.districtName.toString(),
//                           ),
//                         ));
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       FormNewAddress.listValue[1] = value!.districtId.toString();
//                       districtselectedValue = value!;
//                       AddAddressScreen.districtName = value;
//                       widget.addAddressBloc
//                           .add(AddAddressCheckInputEvent(1, FormNewAddress.checkErr));
//                       widget.addAddressBloc.add(
//                           AddAddressAfterSeclectedDistrictEvent(
//                               value.districtId.toString()));
//                     });
//                   },
//                   isExpanded: true,
//                   style: const TextStyle(
//                     color: Color.fromRGBO(17, 17, 19, 0.6),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontStyle: FontStyle.normal,
//                     fontFamily: 'SF Pro Display',
//                   ),
//                 ),
//               )),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(10),
//         ),
//         const Text(
//           'Chọn xã',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//             fontFamily: 'SF Pro Display',
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(8),
//         ),
//         Container(
//           width: getProportionateScreenWidth(336),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Align(
//               alignment: Alignment.centerLeft,
//               child: InputDecorator(
//                 decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0x42111113))),
//                   contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   errorText:
//                   FormNewAddress.checkErr[2] == 1 ? 'Vui lòng chọn xã' : null,
//                 ),
//                 child: DropdownButton(
//                   iconSize: 35,
//                   isDense: false,
//                   underline: const SizedBox(),
//                   value: wardselectedValue,
//                   items: widget.listWard
//                       .map<DropdownMenuItem<WardData>>((WardData value) {
//                     return DropdownMenuItem(
//                         value: value,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                           child: Text(
//                             value.name.toString(),
//                           ),
//                         ));
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       FormNewAddress.listValue[2] = value!.code.toString();
//                       wardselectedValue = value!;
//                       AddAddressScreen.wardName = value;
//                       widget.addAddressBloc
//                           .add(AddAddressCheckInputEvent(2, FormNewAddress.checkErr));
//                     });
//                   },
//                   isExpanded: true,
//                   style: const TextStyle(
//                     color: Color.fromRGBO(17, 17, 19, 0.6),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontStyle: FontStyle.normal,
//                     fontFamily: 'SF Pro Display',
//                   ),
//                 ),
//               )),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(10),
//         ),
//         const Text(
//           'Nhập địa chỉ cụ thể',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//             fontFamily: 'SF Pro Display',
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(8),
//         ),
//         Container(
//           width: getProportionateScreenWidth(336),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: TextField(
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0x42111113))),
//                   errorText: FormNewAddress.checkErr[3] == 1
//                       ? 'Vui lòng không để trống'
//                       : null,
//                   hintText: 'Địa chỉ',
//                   contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
//               style: const TextStyle(
//                 color: Color.fromRGBO(17, 17, 19, 0.6),
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 fontStyle: FontStyle.normal,
//                 fontFamily: 'SF Pro Display',
//               ),
//               onChanged: (value) {
//                 FormNewAddress.listValue[3] = value;
//                 AddAddressScreen.address = value;
//                 widget.addAddressBloc
//                     .add(AddAddressCheckInputEvent(3, FormNewAddress.checkErr));
//               },
//             ),
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(10),
//         ),
//         const Text(
//           'Họ và tên',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//             fontFamily: 'SF Pro Display',
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(8),
//         ),
//         Container(
//           width: getProportionateScreenWidth(336),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: TextField(
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0x42111113))),
//                   errorText:
//                   FormNewAddress.checkErr[4] == 1 ? 'Họ và tên không hợp lệ' : null,
//                   hintText: 'Họ và tên',
//                   contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
//               style: const TextStyle(
//                 color: Color.fromRGBO(17, 17, 19, 0.6),
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 fontStyle: FontStyle.normal,
//                 fontFamily: 'SF Pro Display',
//               ),
//               onChanged: (value) {
//                 FormNewAddress.listValue[4] = value;
//                 AddAddressScreen.receiverName = value;
//                 widget.addAddressBloc
//                     .add(AddAddressCheckInputEvent(4, FormNewAddress.checkErr));
//               },
//             ),
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(10),
//         ),
//         const Text(
//           'Số điện thoại',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//             fontFamily: 'SF Pro Display',
//           ),
//         ),
//         SizedBox(
//           height: getProportionateScreenHeight(8),
//         ),
//         Container(
//           width: getProportionateScreenWidth(336),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                   enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0x42111113))),
//                   errorText: FormNewAddress.checkErr[5] == 1
//                       ? 'Số điện thoại không hợp lệ'
//                       : null,
//                   hintText: 'Số điện thoại',
//                   contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
//               style: const TextStyle(
//                 color: Color.fromRGBO(17, 17, 19, 0.6),
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 fontStyle: FontStyle.normal,
//                 fontFamily: 'SF Pro Display',
//               ),
//               onChanged: (value) {
//                 FormNewAddress.listValue[5] = value;
//                 AddAddressScreen.phoneNumber = value;
//                 widget.addAddressBloc
//                     .add(AddAddressCheckInputEvent(5, FormNewAddress.checkErr));
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }









import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:ecommerce_app_mobile/screens/add_address/add_address_screen.dart';
import 'package:ecommerce_app_mobile/screens/add_address/bloc/add_address_bloc.dart';
import 'package:ecommerce_app_mobile/screens/add_address/bloc/add_address_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class FormNewAddress extends StatefulWidget {
  const FormNewAddress({
    super.key,
    required this.addAddressBloc,
    required this.listCity,
    required this.listDistrict,
    required this.listWard,
  });

  final AddAddressBloc addAddressBloc;
  static final List<int> checkErr=[0,0,0,0,0,0];
  final List<CitiData> listCity;
  final List<DistrictData> listDistrict;
  final List<WardData> listWard;
  static final List<String> listValue = ['', '', '', '', '', '', ''];

  @override
  State<FormNewAddress> createState() => _FormFormNewAddressState();
}

class _FormFormNewAddressState extends State<FormNewAddress> {
  late CitiData cityselectedValue;
  late DistrictData districtselectedValue;
  late WardData wardselectedValue;

  @override
  void initState() {
    super.initState();
    widget.listCity.insert(0, CitiData(provinceId: '0', provinceName: 'Chọn thành phố'));
      cityselectedValue = widget.listCity[0];
      districtselectedValue = widget.listDistrict[0];
      wardselectedValue = widget.listWard[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chọn thành phố',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          width: getProportionateScreenWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x42111113))),
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  errorText: FormNewAddress.checkErr[0] == 1
                      ? 'Vui lòng chọn thành phố'
                      : null,
                ),
                child: DropdownButton(
                  iconSize: 35,
                  isDense: false,
                  underline: const SizedBox(),
                  value: cityselectedValue,
                  items: widget.listCity
                      .map<DropdownMenuItem<CitiData>>((CitiData value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            value.provinceName.toString(),
                          ),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    FormNewAddress.listValue[0] = value!.provinceName.toString();
                    cityselectedValue = value!;
                    AddAddressScreen.cityName = value;
                    widget.addAddressBloc
                        .add(AddAddressCheckInputEvent(0, FormNewAddress.checkErr));
                    widget.addAddressBloc.add(
                        AddAddressAfterSeclectedCityEvent(value.provinceId.toString()));
                  },
                  isExpanded: true,
                  style: const TextStyle(
                    color: Color.fromRGBO(17, 17, 19, 0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        const Text(
          'Chọn huyện',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          width: getProportionateScreenWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x42111113))),
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  errorText:
                  FormNewAddress.checkErr[1] == 1 ? 'Vui lòng chọn huyện' : null,
                ),
                child: DropdownButton(
                  iconSize: 35,
                  isDense: false,
                  underline: const SizedBox(),
                  value: districtselectedValue,
                  items: widget.listDistrict
                      .map<DropdownMenuItem<DistrictData>>(
                          (DistrictData value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            value.districtName.toString(),
                          ),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      FormNewAddress.listValue[1] = value!.districtName.toString();
                      districtselectedValue = value!;
                      AddAddressScreen.districtName = value;
                      widget.addAddressBloc
                          .add(AddAddressCheckInputEvent(1, FormNewAddress.checkErr));
                      widget.addAddressBloc.add(
                          AddAddressAfterSeclectedDistrictEvent(
                              value.districtId.toString()));
                    });
                  },
                  isExpanded: true,
                  style: const TextStyle(
                    color: Color.fromRGBO(17, 17, 19, 0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        const Text(
          'Chọn xã',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          width: getProportionateScreenWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x42111113))),
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  errorText:
                  FormNewAddress.checkErr[2] == 1 ? 'Vui lòng chọn xã' : null,
                ),
                child: DropdownButton(
                  iconSize: 35,
                  isDense: false,
                  underline: const SizedBox(),
                  value: wardselectedValue,
                  items: widget.listWard
                      .map<DropdownMenuItem<WardData>>((WardData value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            value.wardName.toString(),
                          ),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      FormNewAddress.listValue[2] = value!.wardName.toString();
                      wardselectedValue = value!;
                      AddAddressScreen.wardName = value;
                      widget.addAddressBloc
                          .add(AddAddressCheckInputEvent(2, FormNewAddress.checkErr));
                    });
                  },
                  isExpanded: true,
                  style: const TextStyle(
                    color: Color.fromRGBO(17, 17, 19, 0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              )),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        const Text(
          'Nhập địa chỉ cụ thể',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          width: getProportionateScreenWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x42111113))),
                  errorText: FormNewAddress.checkErr[3] == 1
                      ? 'Vui lòng không để trống'
                      : null,
                  hintText: 'Địa chỉ',
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
              style: const TextStyle(
                color: Color.fromRGBO(17, 17, 19, 0.6),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'SF Pro Display',
              ),
              onChanged: (value) {
                FormNewAddress.listValue[3] = value;
                AddAddressScreen.address = value;
                widget.addAddressBloc
                    .add(AddAddressCheckInputEvent(3, FormNewAddress.checkErr));
              },
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        const Text(
          'Họ và tên',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          width: getProportionateScreenWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x42111113))),
                  errorText:
                  FormNewAddress.checkErr[4] == 1 ? 'Họ và tên không hợp lệ' : null,
                  hintText: 'Họ và tên',
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
              style: const TextStyle(
                color: Color.fromRGBO(17, 17, 19, 0.6),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'SF Pro Display',
              ),
              onChanged: (value) {
                FormNewAddress.listValue[4] = value;
                AddAddressScreen.receiverName = value;
                widget.addAddressBloc
                    .add(AddAddressCheckInputEvent(4, FormNewAddress.checkErr));
              },
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        const Text(
          'Số điện thoại',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'SF Pro Display',
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Container(
          width: getProportionateScreenWidth(336),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x42111113))),
                  errorText: FormNewAddress.checkErr[5] == 1
                      ? 'Số điện thoại không hợp lệ'
                      : null,
                  hintText: 'Số điện thoại',
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)),
              style: const TextStyle(
                color: Color.fromRGBO(17, 17, 19, 0.6),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'SF Pro Display',
              ),
              onChanged: (value) {
                FormNewAddress.listValue[5] = value;
                AddAddressScreen.phoneNumber = value;
                widget.addAddressBloc
                    .add(AddAddressCheckInputEvent(5, FormNewAddress.checkErr));
              },
            ),
          ),
        ),
      ],
    );
  }
}
