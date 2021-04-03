import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/profile/help_support.dart';
import 'package:money_app/ui/screens/settings/about_us.dart';
import 'package:money_app/ui/screens/settings/agants.dart';
import 'package:money_app/ui/screens/settings/components/item.dart';
import 'package:money_app/ui/screens/settings/contact_us.dart';
import 'package:money_app/ui/screens/settings/subscription/subscription_screen.dart';
import 'package:money_app/ui/screens/settings/winner_board.dart';

import "package:flutter_gen/gen_l10n/app_localizations.dart";

import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1,
                  ),
                  children: [
                    SettingsItem(
                      title: AppLocalizations.of(context).subscriptionLabel,
                      iconName: ImagesAsset.subscriptionIcon,
                      onSelect: () => Navigator.pushNamed(
                          context, SubscriptionScreen.routeName),
                    ),
                    SettingsItem(
                      title: AppLocalizations.of(context).contactUsLabel,
                      iconName: ImagesAsset.contactUsIcon,
                      onSelect: () => Navigator.pushNamed(
                          context, ContactUsScreen.routeName),
                    ),
                    SettingsItem(
                      title: AppLocalizations.of(context).whoAreWeLabel,
                      iconName: ImagesAsset.aboutUsIcon,
                      onSelect: () =>
                          Navigator.pushNamed(context, AboutUsScreen.routeName),
                    ),
                    SettingsItem(
                      title: AppLocalizations.of(context).agentsLabel,
                      iconName: ImagesAsset.agantIcon,
                      onSelect: () =>
                          Navigator.pushNamed(context, AgantsScreen.routeName),
                    ),
                    SettingsItem(
                      title: AppLocalizations.of(context).helpLabel,
                      iconName: ImagesAsset.helpIcon,
                      onSelect: () => Navigator.pushNamed(
                          context, HelpAndSupportScreen.routeName),
                    ),
                    SettingsItem(
                      title: AppLocalizations.of(context).honorBoardLabel,
                      iconName: ImagesAsset.wreathIcon,
                      onSelect: () => Navigator.pushNamed(
                        context,
                        WinnersBoard.routeName,
                      ),
                    ),
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
