import 'package:flutter/material.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/main.dart';
import 'package:money_app/ui/screens/chat/chat_screen.dart';
import 'package:money_app/ui/screens/home/home_screen.dart';
import 'package:money_app/ui/screens/profile/profile_screen.dart';
import 'package:money_app/ui/screens/settings/settings_screen.dart';
import 'package:money_app/ui/screens/winner/winner_screen.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class LandScreen extends StatefulWidget {
  static String routeName = '/land';
  @override
  _LandScreenState createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    ChatScreen(),
    //WinnerScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  Widget currentScreen = HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          elevation: 3.0,
          child: Image.asset(
            ImagesAsset.cupIcon,
            fit: BoxFit.cover,
            width: 30.0,
            height: 30.0,
          ),
          onPressed: () =>
              navigatorKey.currentState.pushNamed(WinnerScreen.routeName)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = HomeScreen();
                          currentTab = 0;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentTab == 0
                              ? ColorPalettes.secondaryColor
                              : Colors.grey,
                          size: currentTab == 0 ? 34.0 : 24.0,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: currentTab == 0 ? 12.0 : 14.0,
                            color: currentTab == 0
                                ? ColorPalettes.secondaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = ChatScreen();
                          currentTab = 1;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 1
                              ? ColorPalettes.secondaryColor
                              : Colors.grey,
                          size: currentTab == 1 ? 34.0 : 24.0,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: currentTab == 1 ? 12.0 : 14.0,
                            color: currentTab == 1
                                ? ColorPalettes.secondaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = ProfileScreen();
                          currentTab = 2;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 2
                              ? ColorPalettes.secondaryColor
                              : Colors.grey,
                          size: currentTab == 2 ? 34.0 : 24.0,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: currentTab == 2 ? 12.0 : 14.0,
                            color: currentTab == 2
                                ? ColorPalettes.secondaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = SettingsScreen();
                          currentTab = 3;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3
                              ? ColorPalettes.secondaryColor
                              : Colors.grey,
                          size: currentTab == 3 ? 34.0 : 24.0,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: currentTab == 3 ? 12.0 : 14.0,
                            color: currentTab == 3
                                ? ColorPalettes.secondaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
