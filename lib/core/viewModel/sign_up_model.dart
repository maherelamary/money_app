import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/services/authentication_services.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/main.dart';
import 'package:money_app/ui/screens/home/home_screen.dart';
import 'package:money_app/ui/screens/sign_up/otp_screen.dart';

class SignUpModel extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  List<String> _errorMessages = [];
  bool _loading = false;
  Profile _profile;
  User _user;
  bool get loading => _loading;

  AuthenticationServices authenticationServices = AuthenticationServices();
  void registerMobile({Map registerData}) async {
    registerData.forEach((_, value) {
      print("value ${value}");
    });
    setLoading(true);
    await authenticationServices
        .registerWithMobile(registerData)
        .then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {
        Profile newProfile = Profile.fromJson(data['result']);
        //print(profile.token);
        setProfile(newProfile);
        setLoading(false);
        print(_profile.displayName);
        print(_profile.otp);
        print(_profile.id);
        print(_profile.isMobileVerified);

        navigatorKey.currentState.pushNamed(OtpScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        data['errors'].forEach((err) {
          print(data['errors']);
          print(err["description"]);
          _errorMessages.add(err['description']);
          setLoading(false);
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
          msg: "PLEASE, PROVIDE VALID DATA",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink.shade400,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    });
  }

  bool getOTP() {
    if (_profile.otp != null) return true;
    return false;
  }

  void setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  void setProfile(val) {
    _profile = val;
    notifyListeners();
  }

  Profile getProfile() => _profile;

  void verifyUserMobile({Map registerData}) async {
    registerData.forEach((_, value) {
      print("value ${value}");
    });
    await authenticationServices
        .verifyUserMobile(registerData)
        .then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {
        User newUser = User.fromJson(data['result']);
        //print(profile.token);
        setUser(newUser);
        print(newUser.profile.isMobileVerified);
        print(newUser.profile.mobile);
        print(newUser.token);
        print(newUser.refreshToken);
        loginModel.setUser(newUser);
        navigatorKey.currentState.pushNamed(HomeScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        data['errors'].forEach((err) {
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
        Fluttertoast.showToast(
          msg: "Failed to verify your mobile",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink.shade400,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    });
  }

  void setUser(val) {
    _user = val;
    notifyListeners();
  }

  User getUser() => _user;
}
