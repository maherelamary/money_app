import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
class BuildSignUpHeader extends StatelessWidget {
  const BuildSignUpHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 45.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 4.0,
          ),
          Text(
            AppLocalizations.of(context).signUpBodyText,
            style: ColorPalettes.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
