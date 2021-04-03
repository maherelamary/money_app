import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 60.0,
      ),
      child: Column(
        children: [
          Image.asset(
            ImagesAsset.logo,
            width: 70,
            height: 70,
          ),
          Text(
            "money app".toUpperCase(),
            style: TextStyle(
                color: ColorPalettes.appAccentColor,
                fontFamily: 'Changa',
                fontWeight: FontWeight.bold,
                fontSize: 45.0),
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context).loginBodyText,
            style: TextStyle(
                color: ColorPalettes.appColor,
                fontFamily: 'Changa',
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
