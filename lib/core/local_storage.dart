import 'dart:convert';

import 'package:money_app/core/model/user.dart';
import 'package:money_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  saveUser({User user}) async {
    Map<String, dynamic> mappedUserData = User().toJson();
    String encodedUserData = jsonEncode(user);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', encodedUserData);
      print("User => ${encodedUserData}");
    } catch (err) {
      print(
        'Unable to save user data'.toUpperCase() + err.toString(),
      );
    }
  }

  Future<User> loadUserFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String encodedUserMap = prefs.getString('userData');
      Map mappedUser = jsonDecode(encodedUserMap);
      User user = User.fromJson(mappedUser);
      print("User => ${user}");
      return user;
    } catch (err) {
      print(
        'Unable to load user data'.toUpperCase() + err.toString(),
      );
    }
  }

  clearUserFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.clear();
      print("User data has been cleared");
    } catch (err) {
      print(
        'Unable to clear user data'.toUpperCase() + err.toString(),
      );
    }
  }
}
