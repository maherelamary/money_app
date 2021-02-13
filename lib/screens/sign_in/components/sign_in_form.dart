import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_app/screens/sign_up/sign_up_screen.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:money_app/widgets/buttons/sign_in_button.dart';
import 'package:money_app/widgets/buttons/sign_up_button.dart';
import 'package:money_app/widgets/login_input_decoration.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String countryCode;
  String phoneNumber;
  String password;
  bool remember = false;
  bool _clicked = false;
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
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 60.0,
                    child: CountryCodePicker(
                      onChanged: (code) {
                        countryCode = code.toString();
                      },
                    ),
                  ),
                  Expanded(
                    child: _buildPhoneFormField(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    child: _buildPasswordFormField(),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                  ),
                  Container(
                    child: Checkbox(
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
                  ),
                  Text(
                    "Remember me",
                    style: ColorPalettes.bodyTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                _clicked = !_clicked;
              });
            },
            child: signInButton(isClicked: _clicked),
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              return Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: signUpButton(),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneFormField() => Container(
        child: TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (value) {
            phoneNumber = value;
          },
          onChanged: (value) {
            phoneNumber = value;
          },
          decoration: loginInputDecoration(
              labelText: "Phone",
              hintText: "Enter phone number",
              isAlwaysBehavior: true,
              suffixIcon: ImagesAsset.phoneIcon),
        ),
      );

  Widget _buildPasswordFormField() => TextFormField(
        keyboardType: TextInputType.text,
        onSaved: (value) {
          password = value;
        },
        onChanged: (value) {
          password = value;
        },
        decoration: loginInputDecoration(
            labelText: "Password",
            hintText: "Enter Password",
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.passwordIcon),
      );
}
