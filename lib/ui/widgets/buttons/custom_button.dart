import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: ColorPalettes.primaryGradientColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ColorPalettes.appColor.withAlpha(100),
              offset: Offset(
                2,
                4,
              ),
              blurRadius: 8,
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: Text(
        title,
        style:
            TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Cairo'),
      ),
    );
  }
}
