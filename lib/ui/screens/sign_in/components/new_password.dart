import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/screens/profile/edit_profile_screen.dart';
import 'package:money_app/ui/widgets/rounded_rect_input_decoration.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:provider/provider.dart';

class NewPasswordContainer extends StatefulWidget {
  final int userId;
  final String otp;
  NewPasswordContainer({Key key, this.userId, this.otp}) : super(key: key);
  static String routeName = '/newPassword';

  @override
  _NewPasswordContainerState createState() => _NewPasswordContainerState();
}

class _NewPasswordContainerState extends State<NewPasswordContainer> {
  final _forgetPassFormKey = GlobalKey<FormState>();
  String password = "";
  String conformPass = "";
  final List<String> errors = [];
  LoginModel loginModel;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black.withOpacity(0.8),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width - 5.0,
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Crate New Password",
            style: TextStyle(
                color: ColorPalettes.appBorderColor,
                fontFamily: 'Cairo',
                fontSize: 18.0),
          ),
          Form(
            key: _forgetPassFormKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        AppLocalizations.of(context).passwordLabel,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "cairo",
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        height: 50.0,
                        child: buildPasswordFormField(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        AppLocalizations.of(context).conformPasswordLabel,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "cairo",
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 50.0,
                        child: buildPasswordFormField(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (_forgetPassFormKey.currentState.validate()) {
                //Loader
                print('form valid');
                loginModel.resetPasswordByMobile(
                    userId: widget.userId,
                    code: widget.otp,
                    newPassword: password,
                    conformPassword: password);
              } else {
                showAlertDialog(context);
                print('form not valid');
              }
              //return Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: BuildCustomButton(
              title: AppLocalizations.of(context).submitEditProfileLabel,
            ),
          ),
          SizedBox(height: 4.0),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() => TextFormField(
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.white70),
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          } else if (RegExp(
                  r"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$")
              .hasMatch(value)) {
            removeError(error: kDefinePassword);
          }
          password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          } else if (RegExp(
                  r"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$")
              .hasMatch(value)) {
            addError(error: kDefinePassword);
            return "";
          }
          return null;
        },
        decoration: CustomRoundedRectInputDecoration(
          labelText: AppLocalizations.of(context).passwordLabel,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.passwordIcon,
        ),
      );

  TextFormField buildConfirmPasswordFormField() => TextFormField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white70),
        obscureText: true,
        onSaved: (newValue) => conformPass = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.isNotEmpty && password == conformPass) {
            removeError(error: kMatchPassError);
          }
          conformPass = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if ((password != value)) {
            addError(error: kMatchPassError);
            return "";
          }
          return null;
        },
        decoration: CustomRoundedRectInputDecoration(
            labelText: AppLocalizations.of(context).conformPasswordLabel,
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.passwordIcon),
      );

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Info"),
      content: Text(errors[0]),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
