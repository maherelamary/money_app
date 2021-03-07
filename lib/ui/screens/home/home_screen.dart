import "package:flutter/material.dart";
import 'components/home_body.dart';
import 'components/home_header.dart';
import 'components/info_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                HomeHeader(),
                HomeBody(),
              ],
            ),
            Positioned(
              top: 160,
              left: 10.0,
              right: 10.0,
              child: InfoContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
