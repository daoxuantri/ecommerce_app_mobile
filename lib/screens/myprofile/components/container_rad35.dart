import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerRad35 extends StatelessWidget {
  const ContainerRad35({super.key, required this.child, required this.padding});
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35),
      child: Material(
        borderRadius: BorderRadius.circular(35),
        elevation: 5,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: child,
        ),
      ),
    );
  }
}
