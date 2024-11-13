import 'package:flutter/material.dart';

import '../../../size_config.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenHeight(20),
          getProportionateScreenWidth(20),
          getProportionateScreenHeight(10)),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }
}
