import 'package:flutter/widgets.dart';
import 'package:money_app/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/screens/sign_up/otp_screen.dart';
import 'package:money_app/screens/sign_up/sign_up_screen.dart';
import 'package:money_app/screens/splash/splash_screen.dart';
import 'package:money_app/screens/home_page/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
