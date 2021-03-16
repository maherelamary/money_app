import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:money_app/UI/screens/sign_up/otp_screen.dart';
import 'package:money_app/UI/screens/sign_up/sign_up_screen.dart';
import 'package:money_app/UI/widgets/login_input_decoration.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/core/viewModel/sign_up_model.dart';
import 'package:money_app/ui/widgets/buttons/animated_button.dart';
import 'package:money_app/ui/widgets/buttons/custom_button.dart';
import 'package:money_app/ui/widgets/error_container.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String countryCode;
  String phoneNumber;
  //String reformattedCode;
  TextEditingController phoneNumberController = TextEditingController();
  String password;
  TextEditingController passwordController = TextEditingController();
  bool _remember = false;
  bool _clicked = false;
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
                        print(code);
                        //reformattedCode = replaceCharAt(code.toString(), 0, "");
                        countryCode = code.toString();
                        //print(reformattedCode);
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
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 65,
              //     ),
              //     Container(
              //       child: Checkbox(
              //         value: _remember,
              //         activeColor: ColorPalettes.primaryColor,
              //         onChanged: (isRemembered) {
              //           setState(
              //             () {
              //               _remember = isRemembered;
              //             },
              //           );
              //         },
              //       ),
              //     ),
              //     Text(
              //       "Remember me",
              //       style: ColorPalettes.bodyTextStyle,
              //     ),
              //   ],
              // ),
            ],
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
          Spacer(),
          InkWell(
            onTap: () {
              if (_formKey.currentState.validate() && !_clicked) {
                setState(() {
                  _clicked = true;
                });
              } else {
                print('form not valid');
              }
            },
            child: AnimatedButton(
              title: AppLocalizations.of(context).login,
              clicked: _clicked,
              serverLoader: loginModel.loading,
              onComplete: () {
                print('onComplete');

                Map<String, dynamic> registeredData = {
                  "userName": '${countryCode}${phoneNumber}',
                  "password": password,
                  "isMobile": true
                };
                loginModel.loginWithMobile(registerData: registeredData);
                print(countryCode + phoneNumber);
                print(phoneNumber);
                print(password);
                //loginModel.registerMobile(registerData: registeredData);
                //Navigator.pushNamed(context, OtpScreen.routeName);
                print("onComplete Fired");
                setState(() {
                  _clicked = false;
                });

                //Navigator.pushNamed(context, OtpScreen.routeName);
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              return Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: CustomButton(
              title: AppLocalizations.of(context).signUp,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  Widget _buildPhoneFormField() => Container(
        child: TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (value) {
            phoneNumber = value;
          },
          onChanged: (value) {
            print(value);
            if (value.length >= 2) {
              removeError(error: kPhoneNumberNullError);
            }
            phoneNumber = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
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
          if (value.length >= 2) {
            removeError(error: kPassNullError);
          }
          password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          }
          return null;
        },
        decoration: loginInputDecoration(
            labelText: "Password",
            hintText: "Enter Password",
            isAlwaysBehavior: true,
            suffixIcon: ImagesAsset.passwordIcon),
      );
}
