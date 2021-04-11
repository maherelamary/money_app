import 'package:flutter/material.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/screens/home/components/info_container.dart';
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

    return BuildHeader(user: user);
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          height: 180.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorPalettes.appColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            //gradient: ColorPalettes.primaryGradientColor,
          ),
          child: user != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    Expanded(child: ProfileAvatar()),
                    Expanded(
                      child: Text(
                        user.profile.displayName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Cairo',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Positioned(
          bottom: -30.0,
          left: 8.0,
          right: 8.0,
          child: InfoContainer(),
        ),
      ],
    );
  }
}
