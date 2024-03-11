import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../size_config.dart';

class OTPVerifyForm extends StatelessWidget {
  OTPVerifyForm(
      {super.key,
      required this.firstNumController,
      required this.secondNumController,
      required this.thirdController,
      required this.fourthController});

  final TextEditingController firstNumController;
  final TextEditingController secondNumController;

  final TextEditingController thirdController;
  final TextEditingController fourthController;

  double cellHeight = 60;
  double cellWidth = 55;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCell(context, firstNumController),
        _buildCell(context, secondNumController),
        _buildCell(context, thirdController),
        _buildCell(context, fourthController),
      ],
    ));
  }

  SizedBox _buildCell(BuildContext context, TextEditingController controller) {
    return SizedBox(
      height: getProportionateScreenHeight(cellHeight),
      width: getProportionateScreenWidth(cellWidth),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin) {},
        decoration: const InputDecoration(
          hintText: "0",
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        ),
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),

    );
  }
}
