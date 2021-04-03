import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class CustomShareButton extends StatelessWidget {
  final Function onPressed;
  const CustomShareButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: ColorPalettes.appColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.share_outlined,
              color: Colors.white70,
              size: 34.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              //AppLocalizations.of(context).shareWinnerProfileLabel,
              "Share",
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
