import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:money_app/core/services/local_notification_services.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/screens/sign_in/components/new_password.dart';
import 'package:money_app/ui/screens/sign_up/otp_screen.dart';
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
  String countryCode = "";
  String phone = "";
  String otp = "";
  String userId = "";
  String recievedOtp = "";
  bool hasRequestCode = false;
  final List<String> errors = [];

  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationServices.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          //color: Colors.black.withOpacity(0.7),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              Image.asset(
                ImagesAsset.logo,
                width: 70,
                height: 70,
              ),
              Text(
                "money app".toUpperCase(),
                style: TextStyle(
                    color: ColorPalettes.appBorderColor,
                    fontFamily: 'Changa',
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0),
                textAlign: TextAlign.center,
              ),
              Text(
                "Proceed with phone number verification to continue password recovery",
                style: TextStyle(
                    color: ColorPalettes.appAccentColor,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    hasRequestCode
                        ? Text(
                            "Code has been sent to " + countryCode + phone,
                            style: TextStyle(
                                color: ColorPalettes.appBreakColor,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0),
                          )
                        : Text(""),
                    Container(
                      decoration: BoxDecoration(
                        //color: ColorPalettes.appBreakColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 30.0,
                      ),
                      child: loginModel.loading
                          ? Center(child: CircularProgressIndicator())
                          : Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          //width: 60.0,
                                          child: CountryCodePicker(
                                            showFlag: false,
                                            showFlagDialog: true,
                                            //alignLeft: true,
                                            //showCountryOnly: true,
                                            initialSelection: "YE",
                                            emptySearchBuilder: (context) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    "Search result: Country not included",
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontSize: 20.0),
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
                                          margin: EdgeInsets.only(bottom: 40.0),
                                          height: 50.0,
                                          child: _buildPhoneFormField(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                      visible: hasRequestCode,
                                      child: _buildOtpTextFormField()),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState.validate() && !hasRequestCode) {
                    //Loader
                    print('form valid');
                    setState(() {
                      hasRequestCode = true;
                    });
                    loginModel
                        .forgotPasswordByMobile(
                            mobileWithCode: countryCode + phone)
                        .then((arr) {
                      print(arr[0]);
                      print(arr[1]);
                      LocalNotificationServices.showNotificationWithSound(
                          body: arr[0]);
                      setState(() {
                        recievedOtp = arr[0];
                        userId = arr[1];
                      });
                      print("recievedOtp ${recievedOtp}");
                      print("userId ${userId}");
                    });
                  } else if (_formKey.currentState.validate() &&
                      hasRequestCode) {
                    if (recievedOtp == otp) {
                      showNewPasswordDialog(context);
                    }
                  } else {
                    showAlertDialog(context);
                    print('form not valid');
                  }
                },
                child: BuildCustomButton(
                    title: !hasRequestCode
                        ? AppLocalizations.of(context).sendCodeLabel
                        : AppLocalizations.of(context).confirmLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget _buildPhoneFormField() => Container(
        child: TextFormField(
          keyboardType: TextInputType.phone,
          initialValue: phone,
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

  Widget _buildOtpTextFormField() => Container(
        child: TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (value) {
            otp = value;
          },
          onChanged: (value) {
            print(value);
            if (value.length >= 2) {
              removeError(error: kPhoneNumberNullError);
            }
            otp = value;
          },
          validator: (value) {
            if (hasRequestCode) {
              if (value.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return "";
              }
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Verification code",
            labelStyle: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Cairo',
            ),
            fillColor: Colors.black.withOpacity(0.1),
            errorStyle: TextStyle(height: 0),
            hintStyle: TextStyle(
              fontSize: 13.0,
              fontFamily: 'Cairo',
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPalettes.appAccentColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPalettes.appAccentColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPalettes.textColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPalettes.textColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPalettes.appAccentColor,
              ),
            ),
          ),
        ),
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

  showNewPasswordDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.all(15.0),
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2.0,
      backgroundColor: Colors.transparent,
      content: NewPasswordContainer(
        userId: int.parse(userId),
        otp: recievedOtp,
      ),
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
