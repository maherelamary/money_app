import 'package:flutter/material.dart';
import 'package:money_app/routes.dart';
import 'package:money_app/screens/splash/splash_screen.dart';
import 'package:money_app/screens/home_page/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
