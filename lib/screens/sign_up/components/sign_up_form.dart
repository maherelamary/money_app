import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:money_app/widgets/buttons/sign_in_button.dart';
import 'package:money_app/widgets/error_container.dart';
import 'package:money_app/widgets/login_input_decoration.dart';
import '../otp_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String password;
  String conformPass;
  String phone;
  String username;
  String firstName;
  String middleName;
  String surname;
  bool remember = false;
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
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              height: 50.0,
              child: buildPhoneFormField(),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 50.0,
              child: buildFirstNameFormField(),
            ),
            SizedBox(
              height: 15.0,
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
              height: 40.0,
              child: Row(
                children: [
                  Checkbox(
                    value: remember,
                    activeColor: ColorPalettes.primaryColor,
                    onChanged: (isRemembered) {
                      setState(
                        () {
                          remember = isRemembered;
                        },
                      );
                    },
                  ),
                  Text(
                    "Remember me",
                    style: ColorPalettes.bodyTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
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
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }
              },
              child: signInButton(title: "Send Code"),
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
          if (value.length >= 8) {
            removeError(error: kUsernameNullError);
          }
          username = value;
        },
        validator: (value) {
          if (value.length < 8) {
            addError(error: kUsernameNullError);
            return "";
          }
          return null;
        },
        decoration: loginInputDecoration(
          labelText: "Username",
          hintText: "Enter your username",
          isAlwaysBehavior: false,
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
          labelText: "Phone",
          hintText: "Enter phone number",
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.phoneIcon,
        ),
      );

  TextFormField buildPasswordFormField() => TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
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
          }
          return null;
        },
        decoration: loginInputDecoration(
            labelText: "Password",
            hintText: "Enter your Password",
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.passwordIcon),
      );

  TextFormField buildConfirmPasswordFormField() => TextFormField(
        keyboardType: TextInputType.text,
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
            labelText: "Conform",
            hintText: "Re-enter your password",
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
          labelText: "First",
          hintText: "Enter first name",
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
          labelText: "Middle",
          hintText: "Enter middle name",
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
          labelText: "Surname",
          hintText: "Enter surname".toUpperCase(),
          isAlwaysBehavior: true,
          suffixIcon: ImagesAsset.cardIdIcon,
        ),
      );
}
