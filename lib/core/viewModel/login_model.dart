import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/services/authentication_services.dart';
import 'package:money_app/main.dart';
import 'package:money_app/ui/screens/home/home_screen.dart';

class LoginModel extends ChangeNotifier {
  List<String> _errorMessages = [];
  User _user;
  bool _loading = false;
  bool get loading => _loading;

  AuthenticationServices authenticationServices = AuthenticationServices();
  void loginWithMobile({Map registerData}) async {
    registerData.forEach((_, value) {
      print("value ${value}");
    });
    setLoading(true);
    await authenticationServices.loginWithMobile(registerData).then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {
        User loggedUser = User.fromJson(data['result']);
        setUser(loggedUser);
        setLoading(false);
        print(_user.profile.displayName);
        print(_user.token);
        print(_user.profile.otp);
        print(_user.refreshToken);
        navigatorKey.currentState.pushNamed(HomeScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        data['errors'].forEach((err) {
          setLoading(false);
          print(data['errors']);
          print(err["description"]);
          _errorMessages.add(err['description']);
          Fluttertoast.showToast(
            msg: _errorMessages.first,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.pink.shade400,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        });
      } else {
        setLoading(false);
        Fluttertoast.showToast(
          msg: "Failed to login",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink.shade400,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    });
  }

  void setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  void setUser(val) {
    _user = val;
    notifyListeners();
  }

  User getUser() => _user;
}
