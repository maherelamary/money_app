import 'dart:convert';

import 'package:money_app/core/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  saveUser({User user}) async {
    String userData = jsonEncode(user);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', userData);
    } catch (err) {
      print(
        'Unable to save user data'.toUpperCase() + err.toString(),
      );
    }
  }

  loadUserFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Map jsonnedUser = jsonDecode(prefs.getString('userData'));
      var user = User.fromJson(jsonnedUser);
      return user;
    } catch (err) {
      print(
        'Unable to load user data'.toUpperCase() + err.toString(),
      );
    }
  }
}
