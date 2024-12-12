import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_bloc.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_event.dart';
import 'package:ecommerce_app_mobile/screens/address/components/NoAddress.dart';
import 'package:ecommerce_app_mobile/screens/address/components/btn_new_address.dart';
import 'package:ecommerce_app_mobile/screens/address/components/card.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressBody extends StatelessWidget {
  const AddressBody(
      {super.key,
      required this.addressBloc,
      required this.listAddressInf,
      required this.isvisible});

  final bool isvisible;
  final List<AddressDataModel> listAddressInf;
  final AddressBloc addressBloc;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  ],
                ),
              ),
              Container(
                height: getProportionateScreenHeight(500),
                child: ListView.builder(
                  itemCount: listAddressInf.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        _showAddressOptions(context, listAddressInf[index]);
                      },
                      child: AddressCard(
                        addressInf: listAddressInf[index],
                        child: 'Card',
                        addressBloc: addressBloc,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(150)),
          Center(child: AddressButton(addressBloc: addressBloc)),
        ],
      ),
    );
  }

  void _showAddressOptions(BuildContext context, AddressDataModel address) {
  bool isDefault = address.status == true; // Giả sử status là true nếu là địa chỉ mặc định

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Chọn tùy chọn',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    isDefault ? Icons.check : Icons.check,
                    color: isDefault ? Colors.red : null,
                  ),
                  title: Text('Đặt làm địa chỉ mặc định'),
                  onTap: () {
                    setState(() {
                      isDefault = true; // Cập nhật trạng thái khi chọn
                    });
                    _setDefaultAddress(address.sId.toString());
                     Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

  void _setDefaultAddress(String address) {
    // Gọi sự kiện để cập nhật trạng thái địa chỉ
    addressBloc.add(AddressSetDefaultClickedEvent(address));
  }
}
