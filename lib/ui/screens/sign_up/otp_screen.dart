import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:money_app/UI/screens/sign_up/components/otp_form.dart';
import 'package:money_app/UI/widgets/otp_timer.dart';
import 'package:money_app/core/viewModel/sign_up_model.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/sizes.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool showNotification = true;
  SignUpModel signUpModel = SignUpModel();

  @override
  void initState() {
    
    super.initState();
    //Warm up local_notification
    initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    signUpModel = Provider.of<SignUpModel>(context);
    if (showNotification && signUpModel.getOTP()) {
      print('Otp notifications');
      Future.delayed(Duration.zero, () {
        showNotificationWithSound();
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
                    "OTP Verification",
                    style: ColorPalettes.lightHeaderTextStyle,
                  ),
                  Text(
                    "We sent your code to ",
                    style: ColorPalettes.bodyTextStyle,
                  ),
                  buildTimer(),
                  OtpForm(),
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

  void initializeNotification() async {
    try {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettingsIOS = IOSInitializationSettings(
          // requestSoundPermission: true,
          // requestBadgePermission: true,
          // requestAlertPermission: true,
          // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
          );
      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );
      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: didSelectNotification);
    } catch (e) {
      print(e.toString());
    }
  }

  showNotificationWithSound() async {
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('loud_alert'),
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Your verification Code',
      signUpModel.getProfile().otp,
      platformChannelSpecifics,
      payload: 'OTP-Code',
    );
  }

  Future didSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    print("recieved forground notification from iOS");
  }
}
