import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPalettes {
  //Colors for theme
  static Color primaryColor = Color(0xffa01e66);
  static Color secondaryColor = Color(0xffb71e5f);
  static Color thirdColor = Color(0xff36b4e6);
  static Color lightColor = Color(0xffd31c5e);
  static Color textColor = Color(0xff696b6a);
  static Color borderColor = Color(0xffa0a2a0);
  //Some Static For style
  static TextStyle bodyTextStyle =
      TextStyle(color: Colors.black45, fontSize: 15.0);
  static TextStyle headerTextStyle = TextStyle(
    color: primaryColor,
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
  );

  static LinearGradient primaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryColor,
      lightColor,
    ],
  );

  final animationDuration = Duration(milliseconds: 200);
}
