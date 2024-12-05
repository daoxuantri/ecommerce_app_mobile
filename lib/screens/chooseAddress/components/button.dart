import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
import 'package:ecommerce_app_mobile/screens/chooseAddress/components/chooseAddressBody.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../bloc/choose_address_bloc.dart';
import '../bloc/choose_address_event.dart';

class ButtonChooseAddress extends StatefulWidget {
  const ButtonChooseAddress({super.key, required this.chooseAddressBloc});

  final ChooseAddressBloc chooseAddressBloc;

  @override
  State<ButtonChooseAddress> createState() => _ButtonChooseAddressState();
}

class _ButtonChooseAddressState extends State<ButtonChooseAddress> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenHeight(0),
      left: getProportionateScreenWidth(40),
      right: getProportionateScreenWidth(0),
      child: ElevatedButton(
        onPressed: () {
          if(ChooseAddressBody.checkErr.contains(1) || ChooseAddressBody.checkErr.contains(0)){
            widget.chooseAddressBloc.add(ChooseAddressButtonClickErrorEvent());
          }
          else {
            widget.chooseAddressBloc.add(ChooseAddressButtonClickEvent(
                ChooseAddressBody.listValue[0],
                ChooseAddressBody.listValue[1],
                ChooseAddressBody.listValue[2],
                ChooseAddressBody.listValue[3],
                ChooseAddressBody.listValue[4],
                ChooseAddressBody.listValue[5],
            ));
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColor.color0A84FF,
          ),
          minimumSize: MaterialStateProperty.all(Size(
              getProportionateScreenHeight(388),
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
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.051,
          ),
        ),
      ),
    );
  }
}
