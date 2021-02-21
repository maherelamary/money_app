import 'package:flutter/material.dart';
import 'package:money_app/config/locator.dart';
import 'package:money_app/routes.dart';
import 'package:money_app/ui/screens/sign_up/sign_up_screen.dart';
import 'package:money_app/ui/screens/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  //Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 2.0,
          brightness: Brightness.dark,
        ),
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/sign_up':
            return PageTransition(
              child: SignUpScreen(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
              reverseDuration: Duration(seconds: 2500),
              duration: Duration(seconds: 2500),
              curve: Curves.linearToEaseOut,
            );
            break;
          case '/otp':
            return PageTransition(
              child: SignUpScreen(),
              type: PageTransitionType.rightToLeftWithFade,
              settings: settings,
              reverseDuration: Duration(milliseconds: 2500),
              duration: Duration(milliseconds: 2500),
              curve: Curves.linearToEaseOut,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}
