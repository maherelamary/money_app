import 'package:flutter/material.dart';
import 'package:money_app/screens/sign_in/components/sign_in_form.dart';

import 'components/sign_in_header.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  SignInScreen({Key key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            BuildHeader(),
            Expanded(
              child: SignInForm(),
            ),
          ],
        ),
      ),
    );
  }
}
