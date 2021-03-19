import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class WinnerScreen extends StatefulWidget {
  static String routeName = '/winnerbanner';
  WinnerScreen({Key key}) : super(key: key);

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 80.0,
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: Image.asset(
                  ImagesAsset.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: Image.asset(
                ImagesAsset.winnerbanner,
                fit: BoxFit.cover,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: Image.asset(
                    ImagesAsset.winnerborder,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 130.0,
                  width: 130.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                      ImagesAsset.profile,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCustomBackButton(onPressed: () {
                  Navigator.of(context).pop();
                }),
                _buildCustomShareButton(onPressed: null),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomShareButton({Function onPressed}) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: ColorPalettes.secondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.share_outlined,
              color: Colors.white70,
              size: 34.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "Share",
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white, fontSize: 18.0, fontFamily: 'Cairo'),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildCustomBackButton({Function onPressed}) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: ColorPalettes.secondaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white70,
              size: 34.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "Back",
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white, fontSize: 18.0, fontFamily: 'Cairo'),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
