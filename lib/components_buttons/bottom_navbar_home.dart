import 'package:flutter/material.dart';

class NavigatorBottomBar extends StatefulWidget {
  const NavigatorBottomBar({super.key});
  static String routeName = '/navigator-bottom-bar';

  @override
  State<NavigatorBottomBar> createState() => _NavigatorBottomBarState();
}

class _NavigatorBottomBarState extends State<NavigatorBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("HomeScreen")),
      )
    );
  }
}