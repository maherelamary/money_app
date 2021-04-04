import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_app/ui/screens/chat/chat_screen.dart';
import 'package:money_app/ui/screens/land_screen.dart';
import 'package:money_app/ui/screens/profile/edit_profile_screen.dart';
import 'package:money_app/ui/screens/profile/help_support.dart';
import 'package:money_app/ui/screens/profile/profile_screen.dart';
import 'package:money_app/ui/screens/profile/terms_conditions.dart';
import 'package:money_app/ui/screens/settings/about_us.dart';
import 'package:money_app/ui/screens/settings/agants.dart';
import 'package:money_app/ui/screens/settings/contact_us.dart';
import 'package:money_app/ui/screens/settings/settings_screen.dart';
import 'package:money_app/ui/screens/settings/winner_board.dart';
import 'package:money_app/ui/screens/sign_in/forgot_password_screen.dart';
import 'package:money_app/ui/screens/winner/prize.dart';
import 'package:money_app/ui/screens/winner/winner_screen.dart';
import 'package:money_app/ui/widgets/time_over.dart';
import 'UI/screens/home/home_screen.dart';
import 'UI/screens/sign_in/sign_in_screen.dart';
import 'UI/screens/sign_up/otp_screen.dart';
import 'UI/screens/sign_up/sign_up_screen.dart';
import 'UI/screens/splash/splash_screen.dart';
import 'ui/screens/settings/subscription/subscription_screen.dart';

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
  SubscriptionScreen.routeName: (context) => SubscriptionScreen(),
  ContactUsScreen.routeName: (context) => ContactUsScreen(),
  AboutUsScreen.routeName: (context) => AboutUsScreen(),
  TermsAndConditionsScreen.routeName: (context) => TermsAndConditionsScreen(),
  AgantsScreen.routeName: (context) => AgantsScreen(),
  HelpAndSupportScreen.routeName: (context) => HelpAndSupportScreen(),
  PrizeScreen.routeName: (context) => PrizeScreen(),
  WinnersBoard.routeName: (context) => WinnersBoard(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  TimeIsOverScreen.routeName: (context) => TimeIsOverScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};
