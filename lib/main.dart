import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_app/core/model/notification.dart';
import 'package:money_app/core/viewModel/chat_model.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/l10n/l10n.dart';
import 'package:money_app/routes.dart';
import 'package:money_app/ui/screens/home/home_screen.dart';
import 'package:money_app/ui/screens/land_screen.dart';
import 'package:money_app/ui/screens/settings/contact_us.dart';
import 'package:money_app/ui/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/ui/screens/sign_up/sign_up_screen.dart';
import 'package:money_app/ui/screens/splash/splash_screen.dart';
import 'package:money_app/ui/screens/winner/winner_screen.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import 'ui/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _messaging = FirebaseMessaging();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(
          create: (context) => LoginModel(),
        ),
        ChangeNotifierProvider<ChatModel>(
          create: (context) => ChatModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Money App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: ColorPalettes.appAccentColor,
            elevation: 2.0,
            centerTitle: true,
          ),
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        navigatorKey: navigatorKey,
        initialRoute: LandScreen.routeName,
        routes: routes,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/sign_up':
              return PageTransition(
                child: SignUpScreen(),
                type: PageTransitionType.rightToLeftWithFade,
                settings: settings,
                reverseDuration: Duration(milliseconds: 1000),
                duration: Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
              );
              break;
            case '/otp':
              return PageTransition(
                child: SignUpScreen(),
                type: PageTransitionType.rightToLeftWithFade,
                settings: settings,
                reverseDuration: Duration(milliseconds: 1000),
                duration: Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
              );
              break;
            case '/home':
              return PageTransition(
                child: HomeScreen(),
                type: PageTransitionType.rightToLeftWithFade,
                settings: settings,
                reverseDuration: Duration(milliseconds: 700),
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOutCubic,
              );
              break;
            case '/winner':
              return PageTransition(
                child: WinnerScreen(),
                type: PageTransitionType.bottomToTop,
                settings: settings,
                reverseDuration: Duration(milliseconds: 700),
                duration: Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
              );
              break;

            default:
              return null;
          }
        },
      ),
    );
  }

  //Down below related to FCM service
  void registerNotification() async {
    AppNotification _notificationInfo;

    await Firebase.initializeApp();

    await _messaging.requestNotificationPermissions(
      IosNotificationSettings(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      ),
    );

    _messaging.configure(
      onMessage: (message) async {
        print("message recieved");
        AppNotification notification = AppNotification.fromJson(message);
        setState(() {
          _notificationInfo = notification;
        });
        _messaging
            .getToken()
            .then((value) => print('Token $value'))
            .catchError((e) => print('Token $e'));
      },
      onBackgroundMessage: _firebaseMessagingBackgroundHandler,
      onLaunch: (message) async {
        print("message recieved on Launch");
        AppNotification notification = AppNotification.fromJson(message);
        setState(() {
          _notificationInfo = notification;
        });
      },
      onResume: (message) async {
        print("message recieved on Resume");
        AppNotification notification = AppNotification.fromJson(message);
        setState(() {
          _notificationInfo = notification;
        });
      },
    );
  }
}

Future<dynamic> _firebaseMessagingBackgroundHandler(
    Map<String, dynamic> message) async {
  await Firebase.initializeApp();
  print("background Message received");
}
