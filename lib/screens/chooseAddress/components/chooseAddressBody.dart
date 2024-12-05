import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:flutter/material.dart'; 
import '../../../size_config.dart';
import '../bloc/choose_address_bloc.dart';
import '../bloc/choose_address_event.dart';
import '../chooseAddressScreen.dart';
import 'button.dart';

class ChooseAddressBody extends StatefulWidget {
  const ChooseAddressBody(
      {super.key,
      required this.chooseAddressBloc,
      required this.listCity,
      required this.listDistrict,
      required this.listWard});

  final ChooseAddressBloc chooseAddressBloc;
  final List<CitiData> listCity;
  final List<DistrictData> listDistrict;
  final List<WardData> listWard;
  static final List<int> checkErr = [0, 0, 0];
  static final List<String> listValue = ['', '', '', '', '', ''];

  @override
  State<ChooseAddressBody> createState() => _ChooseAddressBodyState();
}

class _ChooseAddressBodyState extends State<ChooseAddressBody> {
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

  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(50),
            left: getProportionateScreenWidth(35)),
        child: SingleChildScrollView(
          child: Column(
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
                        enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x42111113))),
                        contentPadding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                        errorText: ChooseAddressBody.checkErr[0] == 1
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  value.provinceName.toString(),
                                ),
                              ));
                        }).toList(),
                        onChanged: (value) {
                          ChooseAddressBody.listValue[0] = value!.provinceId.toString();
                          ChooseAddressBody.listValue[3] = value!.provinceName.toString();
                          cityselectedValue = value!;
                          ChooseAddressScreen.cityName = value;
                          widget.chooseAddressBloc.add(ChooseAddressCheckInputEvent(
                              0,
                              ChooseAddressBody.checkErr));
                          widget.chooseAddressBloc.add(
                              ChooseAddressAfterSeclectedCityEvent(
                                  value.provinceId.toString()));
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
                height: getProportionateScreenHeight(20),
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
                        ChooseAddressBody.checkErr[1] == 1 ? 'Vui lòng chọn huyện' : null,
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  value.districtName.toString(),
                                ),
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ChooseAddressBody.listValue[1] =
                                value!.districtId.toString();
                            ChooseAddressBody.listValue[4] =
                                value!.districtName.toString();
                            districtselectedValue = value!;
                            ChooseAddressScreen.districtName = value;
                            widget.chooseAddressBloc
                                .add(ChooseAddressCheckInputEvent(1, ChooseAddressBody.checkErr));
                            widget.chooseAddressBloc.add(
                                ChooseAddressAfterSeclectedDistrictEvent(
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
                height: getProportionateScreenHeight(20),
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
                        ChooseAddressBody.checkErr[2] == 1 ? 'Vui lòng chọn xã' : null,
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  value.wardName.toString(),
                                ),
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ChooseAddressBody.listValue[2] =
                                value!.wardId.toString();
                            ChooseAddressBody.listValue[5] =
                                value!.wardName.toString();
                            wardselectedValue = value!;
                            ChooseAddressScreen.wardName = value;
                            widget.chooseAddressBloc
                                .add(ChooseAddressCheckInputEvent(2, ChooseAddressBody.checkErr));
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
                height: getProportionateScreenHeight(380),
              ),
            ],
          ),
        ),
      ),
      ButtonChooseAddress(chooseAddressBloc: widget.chooseAddressBloc,),
    ]);
  }
}
