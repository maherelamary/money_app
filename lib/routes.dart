import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_app/ui/screens/chat/chat_screen.dart';
import 'package:money_app/ui/screens/land_screen.dart';
import 'package:money_app/ui/screens/profile/profile_screen.dart';
import 'package:money_app/ui/screens/settings/settings_screen.dart';
import 'package:money_app/ui/screens/subscribtion/subscribtion_screen.dart';
import 'package:money_app/ui/screens/winner/winner_screen.dart';
import 'UI/screens/home/home_screen.dart';
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
  ChatScreen.routeName: (context) => ChatScreen(),
  LandScreen.routeName: (context) => LandScreen(),
  WinnerScreen.routeName: (context) => WinnerScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  SubscriptionScreen.routeName: (context) => LandScreen(),
};
