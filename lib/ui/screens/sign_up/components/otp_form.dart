import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/UI/widgets/otp_input_decoration.dart';
import 'package:money_app/core/services/local_notification_services.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/sizes.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class OtpForm extends StatefulWidget {
  final bool validate;
  OtpForm({
    Key key,
    @required this.validate,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  LoginModel loginModel = LoginModel();
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;
  String otpCode;
  String number1;
  String number2;
  String number3;
  String number4;
  String number5;
  String number6;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    LocalNotificationServices.initializeNotification();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    number1 = value;
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      number2 = value;
                      nextField(value, pin3FocusNode);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      number3 = value;
                      nextField(value, pin4FocusNode);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      number4 = value;
                      nextField(value, pin5FocusNode);
                    },
                    // Then you need to check is the code is correct or not
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: TextFormField(
                    focusNode: pin5FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      number5 = value;
                      nextField(value, pin6FocusNode);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: TextFormField(
                    focusNode: pin6FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        number6 = value;
                        pin6FocusNode.unfocus();
                      }
                      // Then you need to check is the code is correct or not
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Sizes.dp30(context) * 4,
          ),
          InkWell(
            onTap: () {
              if (number1 != null &&
                  number2 != null &&
                  number3 != null &&
                  number4 != null &&
                  number5 != null &&
                  number6 != null) {
                otpCode =
                    number1 + number2 + number3 + number4 + number5 + number6;
                print(otpCode);

                if (loginModel.getOTP()) {
                  print(
                      "hello world ${loginModel.getProfile.isMobileVerified} hh ${loginModel.getProfile.mobileCountryCode} hh ${loginModel.getProfile.mobile}");
                  if (otpCode == loginModel.getProfile.otp) {
                    print("Verified");
                    Map<String, dynamic> registeredData = {
                      "code": loginModel.getProfile.otp,
                      "mobile": loginModel.getProfile.mobileCountryCode +
                          loginModel.getProfile.mobile
                    };
                    loginModel.verifyUserMobile(registerData: registeredData);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Please, Type a valid verification code',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: ColorPalettes.appAccentColor,
                      textColor: Colors.white,
                      fontSize: 15.0,
                    );
                  }
                }
              }
            },
            child: Container(
              height: 60.0,
              width: 160.0,
              padding: EdgeInsets.all(10.0),
              decoration: ShapeDecoration(
                color: ColorPalettes.appAccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(40.0)),
                  side: BorderSide(
                      width: 1.0, color: ColorPalettes.appAccentColor),
                ),
                // side: new BorderSide(color: Colors.white)
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).confirmLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorPalettes.appColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () async {
              if (widget.validate) {
                if (loginModel.getProfile != null) {
                  var mobile = loginModel.getProfile.mobile;
                  var countryCode = loginModel.getProfile.mobileCountryCode;
                  var phone = countryCode.toString() + mobile.toString();
                  loginModel.resendOtpWithMobile(mobileWithCode: phone);
                  LocalNotificationServices.showNotificationWithSound(
                      body: loginModel.getProfile.otp);
                }
              } else {
                print("time not ended yet");
              }
            },
            child: Text(
              AppLocalizations.of(context).sendCodeButtonLabel,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: ColorPalettes.appAccentColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
