import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/profile/components/app_bar.dart';
import 'package:money_app/ui/screens/profile/components/profile_list_item.dart';

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
            text: 'Invite a Friend',
          ),
          ProfileListItem(
            icon: Icons.history,
            text: 'Purchase History',
          ),
          ProfileListItem(
            icon: Icons.help_outline,
            text: 'Help & Support',
          ),
          ProfileListItem(
            icon: Icons.logout,
            text: 'Logout',
            hasNavigation: false,
          ),
        ],
      ),
    );
  }
}
