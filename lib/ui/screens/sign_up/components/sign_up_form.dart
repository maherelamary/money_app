import 'package:flutter/material.dart';
import 'package:money_app/UI/widgets/error_container.dart';
import 'package:money_app/UI/widgets/login_input_decoration.dart';
import 'package:money_app/core/viewModel/sign_up_model.dart';
import 'package:money_app/ui/widgets/buttons/animated_button.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:provider/provider.dart';
import '../otp_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';

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
  String countryCode;
  //bool remember = false;
  final List<String> errors = [];

  SignUpModel signUpModel = SignUpModel();

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
    signUpModel = Provider.of<SignUpModel>(context);
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
            // Container(
            //   height: 40.0,
            //   child: Row(
            //     children: [
            //       Checkbox(
            //         value: remember,
            //         activeColor: ColorPalettes.primaryColor,
            //         onChanged: (isRemembered) {
            //           setState(
            //             () {
            //               remember = isRemembered;
            //             },
            //           );
            //         },
            //       ),
            //       Text(
            //         "Remember me",
            //         style: ColorPalettes.bodyTextStyle,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 8.0,
            // ),
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
              onTap: () {},
              child: AnimatedButton(
                title: "Send Code",
                onComplete: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Map registeredData = {
                      "displayName": username,
                      "firstName": firstName,
                      "middleName": middleName,
                      "lastName": surname,
                      "mobile": phone,
                      "mobileCountryCode": countryCode,
                      "password": password,
                      "confirmPassword": conformPass,
                    };
                    signUpModel.registerMobile(registerData: registeredData);
                    //Navigator.pushNamed(context, OtpScreen.routeName);
                  }
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
          } else if (RegExp(
                  r"(?=.*[0-9])(?=.*[A-Za-z])(?=.*[~!?@#$%^&*_-])[A-Za-z0-9~!?@#$%^&*_-]{8,40}$")
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
                  r"(?=.*[0-9])(?=.*[A-Za-z])(?=.*[~!?@#$%^&*_-])[A-Za-z0-9~!?@#$%^&*_-]{8,40}$")
              .hasMatch(value)) {
            addError(error: kDefinePassword);
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
