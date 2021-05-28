import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/screens/profile/components/app_bar.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/ui/widgets/profileAvatar.dart';
import 'package:money_app/ui/widgets/rounded_rect_input_decoration.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class EditProfileScreen extends StatefulWidget {
  static String routeName = '/editProfile';
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String password = "";
  String conformPass = "";
  String countryCode = "";
  String phone = "";
  String username = "";
  String fullName = "";
  String imageUrl = "";
  User _user;

  File _imageFile;

  final List<String> errors = [];

  LoginModel loginModel = LoginModel();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      if (_user == null) {
        print("user == null");
        setState(() {
          _user = loginModel.getUser;
          fullName =
              '${_user.profile.firstName} ${_user.profile.middleName} ${_user.profile.lastName}';
        });

        print(_user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    if (_user == null) {
      print("build user == null");
      setState(() {
        _user = loginModel.getUser;
        fullName =
            '${_user.profile.firstName} ${_user.profile.middleName} ${_user.profile.lastName}';
      });

      print(_user);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          ProfileAppBar(
            toEdit: true,
            onChanged: (imgFile) {
              _imageFile = imgFile;
            },
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            AppLocalizations.of(context)
                                .fullnameEditProfileLabel,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 50.0,
                            child: buildFullNameFormField(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            AppLocalizations.of(context)
                                .usernameEditProfileLabel,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 50.0,
                            child: buildUserNameFormField(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            AppLocalizations.of(context)
                                .passwordEditProfileLabel,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Cairo',
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
                            AppLocalizations.of(context)
                                .conformPasswordEditProfileLabel,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 50.0,
                            child: buildConfirmPasswordFormField(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70.0),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          print('form valid');
                          if (_imageFile != null) {
                            await uploadImageFileToStorage(
                                    imageToUpload: _imageFile)
                                .then((downloadedUrl) {
                              print(downloadedUrl.toString());
                              imageUrl = downloadedUrl;
                              print(imageUrl);
                            }).catchError(() {
                              Fluttertoast.showToast(
                                msg: "Unable to upload image",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                              );
                              return;
                            });
                          }
                        } else {
                          showAlertDialog(context);
                          print('form not valid');
                        }
                        //return Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: BuildCustomButton(
                        title:
                            AppLocalizations.of(context).submitEditProfileLabel,
                      ),
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

  TextFormField buildFullNameFormField() => TextFormField(
        keyboardType: TextInputType.name,
        initialValue: _user != null ? fullName : "",
        onSaved: (newValue) => fullName = newValue,
        onChanged: (value) {
          if (value.length >= 10) {
            removeError(error: kfirstNameNullError);
          }
          fullName = value;
        },
        validator: (value) {
          if (value.length < 10) {
            addError(error: kfirstNameNullError);
            return "";
          }
          return null;
        },
        decoration: CustomRoundedRectInputDecoration(
          labelText: AppLocalizations.of(context).nameLabel,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );

  TextFormField buildUserNameFormField() => TextFormField(
        keyboardType: TextInputType.name,
        initialValue: _user != null ? _user.profile.displayName : "",
        onSaved: (newValue) => username = newValue,
        onChanged: (value) {
          if (value.length >= 6) {
            removeError(error: kUsernameNullError);
          }
          username = value;
        },
        validator: (value) {
          if (value.length < 6) {
            addError(error: kUsernameNullError);
            return "";
          }
          return null;
        },
        decoration: CustomRoundedRectInputDecoration(
          labelText: AppLocalizations.of(context).usernameLabel,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );

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
            labelText: AppLocalizations.of(context).passwordLabel,
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.passwordIcon),
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
      content: Text(errors.first),
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

class BuildCustomButton extends StatelessWidget {
  final String title;
  const BuildCustomButton({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: ColorPalettes.primaryGradientColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ColorPalettes.appColor.withAlpha(80),
              offset: Offset(
                2,
                4,
              ),
              blurRadius: 8,
              spreadRadius: 2)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(
        title,
        style:
            TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Cairo'),
      ),
    );
  }
}
