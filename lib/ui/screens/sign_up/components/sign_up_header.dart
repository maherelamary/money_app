import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

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
          Text(
            'Join Our Team',
            style: ColorPalettes.headerTextStyle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'You should fill the required info below correctly. ',
            style: ColorPalettes.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
