import 'package:flutter/material.dart';
import '../size_config.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "assets/images/loading.gif",
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenHeight(300),
        ),
      ),
    );
  }
}
