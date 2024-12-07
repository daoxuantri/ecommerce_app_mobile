import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_bloc.dart';
import 'package:ecommerce_app_mobile/screens/address/bloc/address_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class AddressButton extends StatefulWidget {
  const AddressButton({super.key, required this.addressBloc});

  final AddressBloc addressBloc;

  @override
  State<AddressButton> createState() => _AddressButtonState();
}

class _AddressButtonState extends State<AddressButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.addressBloc.add(AddressButtonClickEvent());
      },
      child: Text(
        'Thêm địa chỉ',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColor.colorFF3B30),
        minimumSize: MaterialStateProperty.all(Size(
            getProportionateScreenHeight(300),
            getProportionateScreenWidth(45))),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ),
    );
  }
}
