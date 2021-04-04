import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/profile/components/app_bar.dart';
import 'package:money_app/ui/screens/profile/edit_profile_screen.dart';
import 'package:money_app/ui/screens/profile/components/profile_list_item.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/ui/screens/profile/help_support.dart';

import 'package:money_app/ui/screens/profile/terms_conditions.dart';
import 'package:money_app/ui/screens/sign_in/sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Maher Ahmad El-Amary',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Cairo',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '@' + 'maherelamary',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Cairo',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'ID',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Cairo',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ProfileListItems(),
        ],
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ProfileListItem(
            icon: Icons.person_add_alt_1_sharp,
            text: AppLocalizations.of(context).iniviteFriendsLabel,
          ),
          ProfileListItem(
            icon: Icons.history,
            text: AppLocalizations.of(context).purchaseHistoryLabel,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, HelpAndSupportScreen.routeName);
            },
            child: ProfileListItem(
              icon: Icons.help_outline,
              text: AppLocalizations.of(context).helpLabel,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, TermsAndConditionsScreen.routeName);
            },
            child: ProfileListItem(
              icon: Icons.insert_drive_file,
              text: AppLocalizations.of(context).termsLabel,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EditProfileScreen.routeName);
            },
            child: ProfileListItem(
              icon: Icons.privacy_tip_outlined,
              text: AppLocalizations.of(context).editProfileLabel,
              hasNavigation: true,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
            child: ProfileListItem(
              icon: Icons.logout,
              text: AppLocalizations.of(context).logoutLabel,
              hasNavigation: false,
            ),
          ),
        ],
      ),
    );
  }
}
