import 'package:flutter/material.dart';
import 'package:money_app/ui/widgets/buttons/custom_rounded_rect_button.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class TimeIsOverScreen extends StatelessWidget {
  static String routeName = '/timeIsOver';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Image.asset(
                    ImagesAsset.timeOver,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Time is Over, Hope you doing well and you will be.",
                    style: ColorPalettes.bodyTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: CustomRoundedRectangleButton(
                  buttonTitle: " Ok, I got it",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icons.check,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
