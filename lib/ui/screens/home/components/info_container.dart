import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';

class InfoContainer extends StatefulWidget {
  InfoContainer({Key key}) : super(key: key);

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 36.0, vertical: 10.0),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "60",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Changa',
                      color: ColorPalettes.lightColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).pointsLabel,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Cairo',
                        color: Colors.blueGrey,
                      ),
                    ),
                    Image.asset(
                      ImagesAsset.pointsIcon,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "1:60",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Changa',
                      color: ColorPalettes.lightColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).timerLabel,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Cairo',
                        color: Colors.blueGrey,
                      ),
                    ),
                    Image.asset(
                      ImagesAsset.timerIcon,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
