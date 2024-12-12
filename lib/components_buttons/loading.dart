import 'package:flutter/material.dart';
import '../size_config.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProportionateScreenHeight(250),),
          Center(
            child: Image.asset(
              "assets/images/rotate.gif",
              width: getProportionateScreenWidth(75),
              height: getProportionateScreenHeight(75),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10),),
          Text('Vui lòng chờ trong giây lát...',
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),),
        ],
      ),
    );
  }
}
