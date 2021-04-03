import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class AboutUsScreen extends StatelessWidget {
  static String routeName = '/about_us';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffE84D8A),
                Color(0xff7558AF),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).aboutUsLabel,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cairo",
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  _buildRowData(text: line1),
                  _buildRowData(text: line2),
                  _buildRowData(text: line1),
                  _buildRowData(text: line2),
                  _buildRowData(text: line2),
                  _buildRowData(text: line1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowData({String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Icon(
              Icons.circle,
              //color: Color(0xffFEB326),
              color: Color(0xff64c5eb).withOpacity(0.8),
              size: 15.0,
            ),
          ),
          Flexible(
            child: Text(
              text,
              softWrap: true,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String line1 =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has";
  static String line2 =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the i";
}
