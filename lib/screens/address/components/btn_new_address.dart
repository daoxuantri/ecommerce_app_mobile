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
          fontSize: 16.0,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.077,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColor.color0A84FF),
        minimumSize: MaterialStateProperty.all(Size(
            getProportionateScreenHeight(355),
            getProportionateScreenWidth(55))),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
