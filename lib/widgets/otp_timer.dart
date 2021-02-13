import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

Row buildTimer() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: ColorPalettes.primaryColor),
          ),
        ),
      ],
    );
