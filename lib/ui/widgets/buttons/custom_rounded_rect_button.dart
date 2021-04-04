import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class CustomRoundedRectangleButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;
  final IconData icon;
  CustomRoundedRectangleButton({this.onPressed, this.buttonTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: ColorPalettes.appColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 34.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              buttonTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
