import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class CustomBackButton extends StatelessWidget {
  final Function onPressed;
  const CustomBackButton({Key key, this.onPressed}) : super(key: key);

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
              Icons.arrow_back_ios,
              color: Colors.white70,
              size: 34.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              //AppLocalizations.of(context).backWinnerProfileLabel,
              "Back",
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
