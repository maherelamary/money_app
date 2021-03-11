import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:money_app/core/model/notification.dart';
import 'package:money_app/core/viewModel/chat_model.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/core/viewModel/sign_up_model.dart';
import 'package:money_app/routes.dart';
import 'package:money_app/ui/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/ui/screens/sign_up/sign_up_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

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
        ChangeNotifierProvider<SignUpModel>(
          create: (context) => SignUpModel(),
        ),
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
              color: Colors.white70,
              elevation: 1.0,
              centerTitle: true,
              brightness: Brightness.light,
              shadowColor: Colors.pink),
          primarySwatch: Colors.pink,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: SignInScreen.routeName,
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
      ),
    );
  }

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
