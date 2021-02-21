import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'UI/screens/home_page/home_screen.dart';
import 'UI/screens/sign_in/sign_in_screen.dart';
import 'UI/screens/sign_up/otp_screen.dart';
import 'UI/screens/sign_up/sign_up_screen.dart';
import 'UI/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
