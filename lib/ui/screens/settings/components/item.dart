import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String iconName;
  final Function onSelect;
  SettingsItem({this.title = "Subscription", this.iconName, this.onSelect});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          color: ColorPalettes.appBreakColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ImageIcon(
                  AssetImage(iconName),
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Cairo",
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
