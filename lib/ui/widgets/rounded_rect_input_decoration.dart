import 'package:flutter/material.dart';
import 'package:money_app/ui/widgets/custom_suffix_icon.dart';
import 'package:money_app/utils/color_palettes.dart';

InputDecoration CustomRoundedRectInputDecoration({
  String labelText,
  String suffixIcon,
  bool isAlwaysBehavior,
}) =>
    InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        fontSize: 13.0,
        fontFamily: 'Cairo',
      ),
      fillColor: Colors.black.withOpacity(0.1),
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
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorPalettes.appAccentColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorPalettes.textColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorPalettes.appAccentColor,
        ),
      ),
    );
