import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/widgets/rounded_rect_input_decoration.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/forgotPassword';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String password = "";
  String conformPass = "";
  String countryCode = "";
  String phone = "";

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
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
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            //width: 60.0,
                            child: CountryCodePicker(
                              alignLeft: true,
                              showCountryOnly: true,
                              initialSelection: "YE",
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
                              onInit: (code) {
                                countryCode = code.toString();
                              },
                              onChanged: (code) {
                                print(code);
                                //reformattedCode = replaceCharAt(code.toString(), 0, "");
                                countryCode = code.toString();
                                //print(reformattedCode);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 50.0,
                            child: _buildPhoneFormField(),
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
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          print('form valid');
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

  Widget _buildPhoneFormField() => Container(
        child: TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (value) {
            phone = value;
          },
          onChanged: (value) {
            print(value);
            if (value.length >= 2) {
              removeError(error: kPhoneNumberNullError);
            }
            phone = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: CustomRoundedRectInputDecoration(
              labelText: AppLocalizations.of(context).phoneLabel,
              isAlwaysBehavior: true,
              suffixIcon: ImagesAsset.phoneIcon),
        ),
      );

  TextFormField buildPasswordFormField() => TextFormField(
        keyboardType: TextInputType.name,
        initialValue: loginModel.getUser.profile.password,
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
        initialValue: loginModel.getUser.profile.conformPassword,
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
