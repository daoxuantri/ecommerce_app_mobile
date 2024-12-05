import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_bloc.dart';
import 'package:ecommerce_app_mobile/screens/address/components/NoAddress.dart';
import 'package:ecommerce_app_mobile/screens/address/components/btn_new_address.dart';
import 'package:ecommerce_app_mobile/screens/address/components/card.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
 

class AddressBody extends StatelessWidget {
  const AddressBody({super.key, required this.addressBloc, required this.listAddressInf, required this.isvisible});

  final bool isvisible;

  final List<AddressDataModel> listAddressInf;

  final AddressBloc addressBloc;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProportionateScreenHeight(55)),
          Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Visibility(
                      visible: isvisible,
                      child: SizedBox(height: getProportionateScreenHeight(20)),
                    ),
                    Visibility(visible: isvisible, child: NoAddress()),
                    Visibility(
                      visible: isvisible,
                      child: SizedBox(height: getProportionateScreenHeight(85)),
                    ),
                    Visibility(
                      visible: !isvisible,
                      child: SizedBox(
                        height: getProportionateScreenHeight(395),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: getProportionateScreenHeight(500),
                child: ListView.builder(
                  itemCount: listAddressInf.length,
                  itemBuilder: (context, index) {
                    return AddressCard(
                      addressInf: listAddressInf[index],
                      child: 'Card',
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          AddressButton(addressBloc: addressBloc,),
        ],
      ),
    );
  }
}
