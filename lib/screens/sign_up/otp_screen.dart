import 'package:flutter/material.dart';
import 'package:money_app/screens/sign_up/components/otp_form.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/sizes.dart';
import 'package:money_app/widgets/otp_timer.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dp30(context)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Sizes.dp30(context) * 4,
                  ),
                  Text(
                    "OTP Verification",
                    style: ColorPalettes.headerTextStyle,
                  ),
                  Text("We sent your code to "),
                  buildTimer(),
                  OtpForm(),
                  SizedBox(
                    height: Sizes.dp30(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
