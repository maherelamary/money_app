import 'package:flutter/material.dart';
import 'package:money_app/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/utils/images_asset.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 900),
      () {
        Navigator.pushNamed(context, SignInScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Image.asset(
              ImagesAsset.background,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
