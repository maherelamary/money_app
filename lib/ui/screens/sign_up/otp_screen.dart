import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:money_app/UI/screens/sign_up/components/otp_form.dart';
import 'package:money_app/core/services/local_notification_services.dart';

import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/ui/widgets/otp_timer.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/sizes.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _validate = false;
  String _timerValue;

  bool showNotification = true;
  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    super.initState();
    //Warm up local_notification
    LocalNotificationServices.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    if (showNotification && loginModel.getOTP()) {
      print('Otp notifications');
      Future.delayed(Duration.zero, () {
        LocalNotificationServices.showNotificationWithSound(
            body: loginModel.getProfile.otp);
      });
      setState(() {
        print('otp connections');
        showNotification = false;
      });
    }
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dp30(context)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Sizes.dp30(context) * 4,
                  ),
                  Text(
                    AppLocalizations.of(context).otpHeader,
                    style: TextStyle(
                      color: ColorPalettes.appAccentColor,
                      fontSize: 30.0,
                      fontFamily: "Cairo",
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).otpGuideText +
                        loginModel.getProfile.mobileCountryCode +
                        loginModel.getProfile.mobile,
                    style: ColorPalettes.bodyTextStyle,
                    softWrap: true,
                  ),
                  BuildTimer(
                    timerHasEnded: (val) {
                      print("Hi+${val}");
                      setState(() {
                        _validate = val;
                      });
                    },
                  ),
                  OtpForm(
                    validate: _validate,
                  ),
                  SizedBox(
                    height: Sizes.dp30(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// void initializeNotification() async {
//   try {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettingsIOS = IOSInitializationSettings(
//         // requestSoundPermission: true,
//         // requestBadgePermission: true,
//         // requestAlertPermission: true,
//         // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//         );
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: didSelectNotification);
//   } catch (e) {
//     print(e.toString());
//   }
// }

// showNotificationWithSound({String body = "123456"}) async {
//   const IOSNotificationDetails iOSPlatformChannelSpecifics =
//       IOSNotificationDetails();
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//           'your channel id', 'your channel name', 'your channel description',
//           importance: Importance.max,
//           priority: Priority.high,
//           playSound: true,
//           sound: RawResourceAndroidNotificationSound('loud_alert'));

//   NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics);

//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Your verification Code',
//     body,
//     platformChannelSpecifics,
//     payload: 'OTP-Code',
//   );
// }

// Future didSelectNotification(String payload) async {
//   if (payload != null) {
//     debugPrint('notification payload: $payload');
//   }
// }

// Future onDidReceiveLocalNotification(
//     int id, String title, String body, String payload) async {
//   print("recieved forground notification from iOS");
// }
