import 'package:flutter/material.dart';
import 'package:money_app/UI/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:money_app/utils/color_palettes.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //[logo radius] regard to screen boundaries.
  final double zoomIn = 1.5;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushNamed(context, SignInScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                stops: [0.3, 1.0],
                colors: [
                  Colors.yellow,
                  ColorPalettes.primaryColor,
                ],
              ),
            ),
            child: Center(
              child: Container(
                height: zoomIn * MediaQuery.of(context).size.height / 5,
                width: zoomIn * MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  ImagesAsset.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
