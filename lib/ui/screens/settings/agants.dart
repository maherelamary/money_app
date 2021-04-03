import 'package:flutter/material.dart';
import 'package:money_app/ui/widgets/agant_item.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class AgantsScreen extends StatelessWidget {
  static String routeName = '/agants';
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
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: Text(
                  AppLocalizations.of(context).agentsLabel,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    fontSize: 35.0,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 0.7,
                  ),
                  children: [
                    AgantItem(),
                    AgantItem(),
                    AgantItem(),
                    AgantItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
