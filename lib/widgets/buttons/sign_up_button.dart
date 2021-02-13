import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

Widget signUpButton() => Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: ColorPalettes.primaryGradientColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ColorPalettes.primaryColor.withAlpha(100),
              offset: Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    );
