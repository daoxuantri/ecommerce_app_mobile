import 'package:flutter/cupertino.dart';

import '../../../size_config.dart';
class NoAddress extends StatefulWidget {
  const NoAddress({super.key});

  @override
  State<NoAddress> createState() => _NoAddressState();
}

class _NoAddressState extends State<NoAddress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/information-point.png",
          //fit: BoxFit.fill,
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenHeight(300),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        const Text(
          'Chưa có địa chỉ nào',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff8E8E93),
            fontSize: 22.0,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.077,
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        const Text(
          'Hãy thêm địa chỉ mới',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff8E8E93),
            fontSize: 15.0,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.006,
          ),
        ),
      ],
    );
  }
}
