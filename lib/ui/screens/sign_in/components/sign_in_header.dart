import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

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
          Text(
            AppLocalizations.of(context).greeting,
            style: ColorPalettes.headerTextStyle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            AppLocalizations.of(context).loginBodyText,
            style: ColorPalettes.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
