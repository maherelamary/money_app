import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/core/viewModel/sign_up_model.dart';
import 'package:money_app/ui/widgets/profileAvatar.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  LoginModel loginModel = LoginModel();
  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileAvatar(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      loginModel.getUser() != null
                          ? loginModel.getUser().profile.displayName
                          : 'UNKNOWN',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
