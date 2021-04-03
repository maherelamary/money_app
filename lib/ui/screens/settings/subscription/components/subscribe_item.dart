import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';

class SubscriptionItem extends StatelessWidget {
  final String title;
  final String price;
  SubscriptionItem({@required this.title, @required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImagesAsset.coin,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    height: 1.0,
                    color: Colors.white,
                    fontFamily: "Changa",
                    fontSize: 28.0,
                  ),
                ),
                Text(
                  "Membership",
                  style: TextStyle(
                    height: 1.0,
                    color: Colors.white,
                    fontFamily: "Changa",
                    fontSize: 10.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Changa",
                          fontSize: 45.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      "\$",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Changa",
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
