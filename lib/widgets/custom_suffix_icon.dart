import 'package:flutter/material.dart';

class CustomSuffixIcon extends StatelessWidget {
  final String suffixIcon;
  CustomSuffixIcon({this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 16.0, 16.0),
      child: ImageIcon(
        AssetImage(
          suffixIcon,
        ),
        size: 14.0,
      ),
    );
  }
}
