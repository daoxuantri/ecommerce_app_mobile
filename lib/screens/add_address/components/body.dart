import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:ecommerce_app_mobile/screens/add_address/components/button.dart';
import 'package:ecommerce_app_mobile/screens/add_address/components/form.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/add_address_bloc.dart';

class AddAddressBody extends StatelessWidget {
  const AddAddressBody(
      {super.key,
      required this.addAddressBloc,
      required this.checkErr,
      required this.listCity,
      required this.listDistrict,
      required this.listWard});

  final AddAddressBloc addAddressBloc;
  final List<int> checkErr;
  final List<CitiData> listCity;
  final List<DistrictData> listDistrict;
  final List<WardData> listWard;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormNewAddress(
            addAddressBloc: addAddressBloc,
            listCity: listCity,
            listDistrict: listDistrict,
            listWard: listWard,
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          ButtonNewAddress(
            addAddressBloc: addAddressBloc,
          ),
        ],
      ),
    );
  }
}
