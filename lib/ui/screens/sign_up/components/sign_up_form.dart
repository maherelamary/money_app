import 'package:flutter/material.dart';
import 'package:money_app/UI/widgets/error_container.dart';
import 'package:money_app/UI/widgets/login_input_decoration.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/screens/sign_up/otp_screen.dart';
import 'package:money_app/ui/widgets/buttons/animated_button.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String password = "";
  String conformPass = "";
  String phone = "";
  String username = "";
  String firstName = "";
  String middleName = "";
  String surname = "";
  String countryCode = "";
  bool clicked = false;
  //bool remember = false;
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
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 50,
              child: buildUserNameFormField(),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  width: 60.0,
                  height: 50.0,
                  child: CountryCodePicker(
                    alignLeft: true,
                    showCountryOnly: true,
                    emptySearchBuilder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Search result: Country not included",
                            softWrap: true,
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    initialSelection: "YE",
                    onInit: (code) {
                      countryCode = code.toString();
                    },
                    onChanged: (code) {
                      countryCode = code.dialCode.toString();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    height: 50.0,
                    child: buildPhoneFormField(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15.0),
              height: 50.0,
              child: buildFirstNameFormField(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 50.0,
              child: buildMiddleNameFormField(),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 50.0,
              child: buildLastNameFormField(),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: buildPasswordFormField(),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 50.0,
              child: buildConfirmPasswordFormField(),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: FormErrorAlert(
                errors: errors,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState.validate() && !clicked) {
                  setState(() {
                    clicked = true;
                  });
                } else {
                  print('form not valid');
                }
              },
              child: AnimatedButton(
                title: AppLocalizations.of(context).sendCodeLabel,
                clicked: clicked,
                serverLoader: loginModel.loading,
                onComplete: () {
                  print('onComplete');
                  Map<String, dynamic> registeredData = {
                    "firstName": firstName,
                    "middleName": middleName,
                    "lastName": surname,
                    "mobile": phone,
                    "mobileCountryCode": countryCode,
                    "displayName": username,
                    "password": password,
                    "confirmPassword": conformPass,
                  };
                  loginModel.registerMobile(registerData: registeredData);
                  setState(() {
                    clicked = false;
                  });
                  if (loginModel.getProfile != null) {
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  }

                  //Navigator.pushNamed(context, OtpScreen.routeName);
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildUserNameFormField() => TextFormField(
        keyboardType: TextInputType.name,
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
        decoration: loginInputDecoration(
          labelText: AppLocalizations.of(context).usernameLabel,
          hintText: AppLocalizations.of(context).usernameHint,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );

  TextFormField buildPhoneFormField() => TextFormField(
        keyboardType: TextInputType.phone,
        onSaved: (newValue) => phone = newValue,
        onChanged: (value) {
          if (value.length >= 5) {
            removeError(error: kPhoneNumberNullError);
          }
          phone = value;
        },
        validator: (value) {
          if (value.length < 5) {
            addError(error: kPhoneNumberNullError);
            return "";
          }
          return null;
        },
        decoration: loginInputDecoration(
          labelText: AppLocalizations.of(context).phoneLabel,
          hintText: AppLocalizations.of(context).phoneHint,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.phoneIcon,
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
        decoration: loginInputDecoration(
            labelText: AppLocalizations.of(context).passwordLabel,
            hintText: AppLocalizations.of(context).passwordHint,
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
        decoration: loginInputDecoration(
            labelText: AppLocalizations.of(context).conformPasswordLabel,
            hintText: AppLocalizations.of(context).conformpasswordHint,
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.passwordIcon),
      );
  TextFormField buildFirstNameFormField() => TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => firstName = newValue,
        onChanged: (value) {
          if (value.length >= 2) {
            removeError(error: kfirstNameNullError);
          }
          firstName = value;
        },
        validator: (value) {
          if (value.length < 2) {
            addError(error: kfirstNameNullError);
            return "";
          }
          return null;
        },
        decoration: loginInputDecoration(
          labelText: AppLocalizations.of(context).firstnameLabel,
          hintText: AppLocalizations.of(context).firstnameHint,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );

  TextFormField buildMiddleNameFormField() => TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => middleName = newValue,
        onChanged: (value) {
          if (value.length >= 2) {
            removeError(error: kMiddleNameNullError);
          }
          middleName = value;
        },
        validator: (value) {
          if (value.length < 2) {
            addError(error: kMiddleNameNullError);
            return "";
          }
          return null;
        },
        decoration: loginInputDecoration(
          labelText: AppLocalizations.of(context).middleNameLabel,
          hintText: AppLocalizations.of(context).middleNameHint,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );

  TextFormField buildLastNameFormField() => TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => surname = newValue,
        onChanged: (value) {
          if (value.length >= 2) {
            removeError(error: kLastNameNullError);
          }
          surname = value;
        },
        validator: (value) {
          if (value.length < 2) {
            addError(error: kLastNameNullError);
            return "";
          }
          return null;
        },
        decoration: loginInputDecoration(
          labelText: AppLocalizations.of(context).lastNameLabel,
          hintText: AppLocalizations.of(context).lastNameHint,
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );
}
