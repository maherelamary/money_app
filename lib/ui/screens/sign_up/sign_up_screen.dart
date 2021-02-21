import 'package:flutter/material.dart';
import 'components/sign_up_header.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/sign_up';
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Column(
              children: [
                BuildSignUpHeader(),
                Expanded(
                  child: SignUpForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
