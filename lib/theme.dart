import 'package:flutter/material.dart';
import '../constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: backgroundcolor,
    fontFamily: "SFPro",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {

  return InputDecorationTheme(
    //floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputFocusedBorder(),
    errorBorder: outlineInputBorder_error(),
    focusedErrorBorder: outlineInputFocusedBorder_error(),
    border: outlineInputBorder(),
    errorStyle: TextStyle(fontSize: 14),
  );
}

TextTheme textTheme() {
  return const TextTheme(
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
