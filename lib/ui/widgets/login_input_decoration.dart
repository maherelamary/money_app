import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

import 'custom_suffix_icon.dart';

//custom InputDecoration for login and sign up UI.screens
InputDecoration loginInputDecoration({
  String labelText,
  String hintText = "....",
  String suffixIcon,
  bool isAlwaysBehavior,
}) =>
    InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        fontSize: 13.0,
        fontFamily: 'Cairo',
      ),
      hintText: hintText,
      errorStyle: TextStyle(height: 0),
      hintStyle: TextStyle(
        fontSize: 13.0,
        fontFamily: 'Cairo',
      ),
      floatingLabelBehavior: isAlwaysBehavior
          ? FloatingLabelBehavior.always
          : FloatingLabelBehavior.never,
      suffixIcon: CustomSuffixIcon(suffixIcon: suffixIcon),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.primaryColor,
        ),
      ),
    );

InputDecoration loginInputDecorationWOIcon({
  String labelText,
  String hintText = "....",
  bool isAlwaysBehavior,
}) =>
    InputDecoration(
      labelText: labelText,
      hintText: hintText,
      floatingLabelBehavior: isAlwaysBehavior
          ? FloatingLabelBehavior.always
          : FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 10,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29),
        borderSide: BorderSide(
          color: ColorPalettes.primaryColor,
        ),
      ),
    );
