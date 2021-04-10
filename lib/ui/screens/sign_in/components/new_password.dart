import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/profile/edit_profile_screen.dart';
import 'package:money_app/ui/widgets/rounded_rect_input_decoration.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class NewPasswordContainer extends StatefulWidget {
  NewPasswordContainer({Key key}) : super(key: key);
  static String routeName = '/newPassword';

  @override
  _NewPasswordContainerState createState() => _NewPasswordContainerState();
}

class _NewPasswordContainerState extends State<NewPasswordContainer> {
  final _forgetPassFormKey = GlobalKey<FormState>();
  String password = "";
  String conformPass = "";
  final List<String> errors = [];

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black.withOpacity(0.1),
      ),
      height: MediaQuery.of(context).size.height / 2.8,
      width: MediaQuery.of(context).size.width - 30,
      padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
      child: Column(
        children: [
          Text(
            "Crate New Password",
            style: TextStyle(
                color: ColorPalettes.appBorderColor,
                fontFamily: 'Cairo',
                fontSize: 17.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          Form(
            key: _forgetPassFormKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(AppLocalizations.of(context).passwordLabel),
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
                          AppLocalizations.of(context).conformPasswordLabel),
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
          Spacer(),
          InkWell(
            onTap: () {
              if (_forgetPassFormKey.currentState.validate()) {
                //Loader
                print('form valid');
                //TODO call api to send OTP.

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
            labelText: AppLocalizations.of(context).phoneLabel,
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.phoneIcon),
      );

  TextFormField buildConfirmPasswordFormField() => TextFormField(
        keyboardType: TextInputType.text,
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
            labelText: AppLocalizations.of(context).phoneLabel,
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.phoneIcon),
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
