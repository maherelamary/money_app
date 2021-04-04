import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

Container buildTimer() => Container(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 59.0, end: 0.0),
        duration: Duration(seconds: 100),
        builder: (_, value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: ColorPalettes.appColor),
        ),
      ),
    );
