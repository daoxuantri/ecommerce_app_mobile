import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../bloc/add_address_bloc.dart';
import '../bloc/add_address_event.dart';
import 'form.dart';

class ButtonNewAddress extends StatefulWidget {
  const ButtonNewAddress({super.key, required this.addAddressBloc});

  final AddAddressBloc addAddressBloc;

  @override
  State<ButtonNewAddress> createState() => _ButtonNewAddressState();
}

class _ButtonNewAddressState extends State<ButtonNewAddress> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (FormNewAddress.checkErr.contains(1) ||
            FormNewAddress.checkErr.contains(0)) {
          // widget.addAddressBloc.add(AddAddressButtonClickErrorEvent());
        } else {
          // widget.addAddressBloc.add(AddAddressButtonClickEvent(
          //   FormNewAddress.listValue[4],
          //   FormNewAddress.listValue[5],
          //   'VN',
          //   FormNewAddress.listValue[0],
          //   FormNewAddress.listValue[1],
          //   FormNewAddress.listValue[2],
          //   FormNewAddress.listValue[3],
          //   FormNewAddress.listValue[6],
          // ));

          print(FormNewAddress.listValue[4]); //dao xuan tri
          print(FormNewAddress.listValue[5]); // phone
          print(FormNewAddress.listValue[0]); //citi

          print(FormNewAddress.listValue[1]); //huyen
          print(FormNewAddress.listValue[2]); //xa
          print(FormNewAddress.listValue[3]); //dc cu the
          print(FormNewAddress.listValue[6]);

          String fullAddress = [
            FormNewAddress.listValue[3],
            FormNewAddress.listValue[2],
            FormNewAddress.listValue[1],
            FormNewAddress.listValue[0],
          ].join(', ');
          if (FormNewAddress.listValue[6] == '') {
            widget.addAddressBloc.add(AddAddressButtonClickEvent(
            FormNewAddress.listValue[4], FormNewAddress.listValue[5], fullAddress, false
          ));
          }else{
            widget.addAddressBloc.add(AddAddressButtonClickEvent(
            FormNewAddress.listValue[4], FormNewAddress.listValue[5], fullAddress, FormNewAddress.listValue[6]
          ));
          }

          
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColor.colorFF3B30,
        ),
        minimumSize: MaterialStateProperty.all(Size(
            getProportionateScreenHeight(300),
            getProportionateScreenWidth(45))),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        // foregroundColor: MaterialStateProperty.all(AppColor.colorWhite),
      ),
      child: const Text(
        "Hoàn thành",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
