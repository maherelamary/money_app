import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: 15.0,
  ),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(isfocused: true),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder({bool isfocused = false}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: isfocused
          ? BorderSide(color: ColorPalettes.lightColor)
          : BorderSide(color: ColorPalettes.primaryColor),
    );
