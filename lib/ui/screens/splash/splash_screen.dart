import 'package:flutter/material.dart';
import 'package:money_app/UI/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/core/local_storage.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/screens/land_screen.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //[logo radius] regard to screen boundaries.
  static const double zoomIn = 1.5;
  User _user;
  LoginModel loginModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        LocalStorage().loadUser().then((usr) {
          _user = usr;
          loginModel.setUser(usr);
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        _user == null
            ? Navigator.pushNamed(context, SignInScreen.routeName)
            : Navigator.pushNamed(
                context,
                LandScreen.routeName,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPalettes.appColor,
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     ColorPalettes.appColor,
              //     ColorPalettes.appAccentColor,
              //   ],
              // ),
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
