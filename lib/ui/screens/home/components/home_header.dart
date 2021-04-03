import 'package:flutter/material.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/widgets/profileAvatar.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class HomeHeader extends StatefulWidget {
  HomeHeader({Key key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  LoginModel loginModel = LoginModel();
  User user;
  @override
  void initState() {
    super.initState();
    setState(() {
      user = loginModel.getUser;
      print("from init${user}");
    });
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    if (user == null) {
      setState(() {
        user = loginModel.getUser;
        print("from build${user}");
      });
    }

    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              gradient: ColorPalettes.primaryGradientColor,
            ),
            child: Container(
              width: double.infinity,
              height: 200.0,
              color: ColorPalettes.appColor,
              child: Center(
                child: user != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileAvatar(),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            user.profile.displayName,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Cairo',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
