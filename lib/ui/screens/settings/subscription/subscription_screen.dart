import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/settings/subscription/components/subscribe_item.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/constants.dart';
import 'package:money_app/utils/images_asset.dart';

class SubscriptionScreen extends StatefulWidget {
  static String routeName = '/settings';

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorPalettes.appColor,
                ColorPalettes.appAccentColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  AppLocalizations.of(context).subscriptionLabel,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    fontFamily: "cairo",
                    fontSize: 35.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //crossAxisSpacing: 15.0,
                        mainAxisSpacing: 30.0,
                        childAspectRatio: 2,
                      ),
                      children: [
                        SubscriptionItem(
                          title: monthlyTitle,
                          price: monthlyPlan,
                        ),
                        SubscriptionItem(
                          title: sixMonthsTitle,
                          price: sixMonthsPlan,
                        ),
                        SubscriptionItem(
                          title: annualTitle,
                          price: annualPlan,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
