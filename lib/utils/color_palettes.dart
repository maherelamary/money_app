import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPalettes {
  //Colors for theme
  //E84D8A
  //7F58AF
  //FEB326
  //64C5EB
  static Color appColor = Color(0xffE84D8A);
  static Color appAccentColor = Color(0xff7F58AF);
  static Color appBorderColor = Color(0xffFEB326);
  static Color appBreakColor = Color(0xff64C5EB);
  static Color textColor = Color(0xff696b6a);
  static Color borderColor = Color(0xffa0a2a0);
  //Some Static For style
  static TextStyle bodyTextStyle = TextStyle(
    color: Colors.black45,
    fontSize: 15.0,
    fontFamily: 'Cairo',
  );

  static TextStyle headerTextStyle = TextStyle(
    color: appColor,
    fontSize: 36.0,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold,
  );

  static TextStyle lightHeaderTextStyle = TextStyle(
    color: appColor,
    fontSize: 36.0,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold,
  );

  static LinearGradient primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      appColor,
      appAccentColor,
    ],
  );

  final animationDuration = Duration(milliseconds: 200);
}
