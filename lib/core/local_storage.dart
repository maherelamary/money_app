import 'dart:convert';

import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  saveUser({User user}) async {
    print("init saveUser");
    Map<String, dynamic> mappedUserData = user.toJson();
    print(mappedUserData);
    String encodedUserData = jsonEncode(user);
    print(encodedUserData);
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

  Future<User> loadUser() async {
    try {
      print("init loadUser");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String encodedUserMap = prefs.getString('userData');
      Map mappedUser = json.decode(encodedUserMap);
      User user = User.fromJson(mappedUser);
      print("User => ${user}");
      return user;
    } catch (err) {
      print('Unable to load user data'.toUpperCase() + err.toString());
      return null;
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
