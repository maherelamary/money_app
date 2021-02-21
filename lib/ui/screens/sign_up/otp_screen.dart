import 'package:flutter/material.dart';
import 'package:money_app/UI/screens/sign_up/components/otp_form.dart';
import 'package:money_app/UI/widgets/otp_timer.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/sizes.dart';

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
                    style: ColorPalettes.lightHeaderTextStyle,
                  ),
                  Text(
                    "We sent your code to ",
                    style: ColorPalettes.bodyTextStyle,
                  ),
                  buildTimer(),
                  OtpForm(),
                  SizedBox(
                    height: Sizes.dp30(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
