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
  static final List<int> checkErr = [0, 0, 0, 0, 0, 0];
  final List<CitiData> listCity;
  final List<DistrictData> listDistrict;
  final List<WardData> listWard;
  static final List<dynamic> listValue = ['', '', '', '', '', '', '',false];

  @override
  State<FormNewAddress> createState() => _FormFormNewAddressState();
}

class _FormFormNewAddressState extends State<FormNewAddress> {
  late CitiData cityselectedValue;
  late DistrictData districtselectedValue;
  late WardData wardselectedValue;
  bool isDefaultAddress = false;

  @override
  void initState() {
    super.initState();
    widget.listCity.insert(
        0, CitiData(provinceId: '0', provinceName: 'Chọn tỉnh, thành phố'));
    cityselectedValue = widget.listCity[0];
    districtselectedValue = widget.listDistrict[0];
    wardselectedValue = widget.listWard[0];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15,8,8,8),
          child: Text(
            'THÔNG TIN NGƯỜI NHẬN',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ),
        Container(
          width: getFullWidth(),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15,8,8,8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Họ và tên',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '  (Bắt buộc)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Container(
                  width: getProportionateScreenWidth(380),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x42111113))),
                          errorText: FormNewAddress.checkErr[4] == 1
                              ? 'Họ và tên không hợp lệ'
                              : null,
                          hintText: 'Họ và tên',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                      style: const TextStyle(
                        color: Color.fromRGBO(17, 17, 19, 0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (value) {
                        FormNewAddress.listValue[4] = value;
                        AddAddressScreen.receiverName = value;
                        widget.addAddressBloc.add(AddAddressCheckInputEvent(
                            4, FormNewAddress.checkErr));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  children: [
                    Text(
                      'Số điện thoại',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '  (Bắt buộc)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Container(
                  width: getProportionateScreenWidth(380),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x42111113))),
                          errorText: FormNewAddress.checkErr[5] == 1
                              ? 'Số điện thoại không hợp lệ'
                              : null,
                          hintText: 'Số điện thoại',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                      style: const TextStyle(
                        color: Color.fromRGBO(17, 17, 19, 0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (value) {
                        FormNewAddress.listValue[5] = value;
                        AddAddressScreen.phoneNumber = value;
                        widget.addAddressBloc.add(AddAddressCheckInputEvent(
                            5, FormNewAddress.checkErr));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15,8,8,8),
          child: Text(
            'ĐỊA CHỈ NHẬN HÀNG',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ),
        Container(
          width: getFullWidth(),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15,8,8,8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Chọn tỉnh, thành phố',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '  (Bắt buộc)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Container(
                  width: getProportionateScreenWidth(380),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x42111113))),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          errorText: FormNewAddress.checkErr[0] == 1
                              ? 'Vui lòng chọn tỉnh, thành phố'
                              : null,
                        ),
                        child: DropdownButton(
                          iconSize: 25,
                          isDense: true,
                          underline: const SizedBox(),
                          value: cityselectedValue,
                          items: widget.listCity
                              .map<DropdownMenuItem<CitiData>>(
                                  (CitiData value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Text(
                                    value.provinceName.toString(),
                                  ),
                                ));
                          }).toList(),
                          onChanged: (value) {
                            FormNewAddress.listValue[0] =
                                value!.provinceName.toString();
                            cityselectedValue = value!;
                            AddAddressScreen.cityName = value;
                            widget.addAddressBloc.add(AddAddressCheckInputEvent(
                                0, FormNewAddress.checkErr));
                            widget.addAddressBloc.add(
                                AddAddressAfterSeclectedCityEvent(
                                    value.provinceId.toString()));
                          },
                          isExpanded: true,
                          style: const TextStyle(
                            color: Color.fromRGBO(17, 17, 19, 0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  children: [
                    Text(
                      'Chọn huyện',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '  (Bắt buộc)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Container(
                  width: getProportionateScreenWidth(380),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x42111113))),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          errorText: FormNewAddress.checkErr[1] == 1
                              ? 'Vui lòng chọn huyện'
                              : null,
                        ),
                        child: DropdownButton(
                          iconSize: 25,
                          isDense: true,
                          underline: const SizedBox(),
                          value: districtselectedValue,
                          items: widget.listDistrict
                              .map<DropdownMenuItem<DistrictData>>(
                                  (DistrictData value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Text(
                                    value.districtName.toString(),
                                  ),
                                ));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              FormNewAddress.listValue[1] =
                                  value!.districtName.toString();
                              districtselectedValue = value!;
                              AddAddressScreen.districtName = value;
                              widget.addAddressBloc.add(
                                  AddAddressCheckInputEvent(
                                      1, FormNewAddress.checkErr));
                              widget.addAddressBloc.add(
                                  AddAddressAfterSeclectedDistrictEvent(
                                      value.districtId.toString()));
                            });
                          },
                          isExpanded: true,
                          style: const TextStyle(
                            color: Color.fromRGBO(17, 17, 19, 0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  children: [
                    Text(
                      'Chọn xã',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '  (Bắt buộc)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Container(
                  width: getProportionateScreenWidth(380),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x42111113))),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          errorText: FormNewAddress.checkErr[2] == 1
                              ? 'Vui lòng chọn xã'
                              : null,
                        ),
                        child: DropdownButton(
                          iconSize: 25,
                          isDense: true,
                          underline: const SizedBox(),
                          value: wardselectedValue,
                          items: widget.listWard
                              .map<DropdownMenuItem<WardData>>(
                                  (WardData value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Text(
                                    value.wardName.toString(),
                                  ),
                                ));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              FormNewAddress.listValue[2] =
                                  value!.wardName.toString();
                              wardselectedValue = value!;
                              AddAddressScreen.wardName = value;
                              widget.addAddressBloc.add(
                                  AddAddressCheckInputEvent(
                                      2, FormNewAddress.checkErr));
                            });
                          },
                          isExpanded: true,
                          style: const TextStyle(
                            color: Color.fromRGBO(17, 17, 19, 0.6),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Row(
                  children: [
                    Text(
                      'Nhập địa chỉ cụ thể',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '  (Bắt buộc)',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Container(
                  width: getProportionateScreenWidth(380),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x42111113))),
                          errorText: FormNewAddress.checkErr[3] == 1
                              ? 'Vui lòng không để trống'
                              : null,
                          hintText: 'Số nhà, tên đường',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                      style: const TextStyle(
                        color: Color.fromRGBO(17, 17, 19, 0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (value) {
                        FormNewAddress.listValue[3] = value;
                        AddAddressScreen.address = value;
                        widget.addAddressBloc.add(AddAddressCheckInputEvent(
                            3, FormNewAddress.checkErr));
                      },
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,25,0),
                  child: Row(
                    children: [
                      Text(
                        'Đặt làm địa chỉ mặc định',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: getProportionateScreenWidth(15), // Thay đổi chiều rộng
                        height: getProportionateScreenHeight(30), // Thay đổi chiều cao
                        child: Switch(
                          value: isDefaultAddress,
                          onChanged: (value) {
                            setState(() {
                              isDefaultAddress = value;
                               FormNewAddress.listValue[6] = value;
                            });
                          },
                          activeColor: Colors.red,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(8),),
                

              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }
}
