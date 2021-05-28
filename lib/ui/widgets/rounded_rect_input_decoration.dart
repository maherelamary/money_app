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
        color: Colors.grey,
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      errorStyle: TextStyle(height: 0),
      hintStyle:
          TextStyle(fontSize: 13.0, fontFamily: 'Cairo', color: Colors.white),
      floatingLabelBehavior: isAlwaysBehavior
          ? FloatingLabelBehavior.always
          : FloatingLabelBehavior.never,
      suffixIcon: CustomSuffixIcon(
        suffixIcon: suffixIcon,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 15,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey,
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
          color: Colors.grey,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: ColorPalettes.appAccentColor,
        ),
      ),
    );
