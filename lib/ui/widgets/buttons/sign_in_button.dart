import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

Widget signInButton({
  String title = "Sign in",
  bool isClicked = false,
}) {
  return AnimatedContainer(
    duration: Duration(
      milliseconds: 50,
    ),
    width: isClicked ? 50 : 250,
    height: 50.0,
    curve: Curves.fastOutSlowIn,
    //padding: EdgeInsets.symmetric(vertical: 10.0),
    //margin: EdgeInsets.symmetric(horizontal: 13.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: ColorPalettes.secondaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(isClicked ? 30 : 60),
      ),
    ),
    child: !isClicked
        ? Text(
            title,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          )
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2.0,
            ),
          ),
  );
}
