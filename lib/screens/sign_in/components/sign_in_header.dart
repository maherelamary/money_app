import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

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
            'Welcome Back',
            style: ColorPalettes.headerTextStyle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'It\'s not about the number of hours you practice, It\'s about the number of hours your mind is present during this practice',
            style: ColorPalettes.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
