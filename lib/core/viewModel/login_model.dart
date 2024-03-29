import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/core/local_storage.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/services/authentication_services.dart';
import 'package:money_app/main.dart';
import 'package:money_app/ui/screens/home/home_screen.dart';
import 'package:money_app/ui/screens/land_screen.dart';
import 'package:money_app/ui/screens/sign_in/sign_in_screen.dart';
import 'package:money_app/ui/screens/sign_up/otp_screen.dart';

class LoginModel extends ChangeNotifier {
  List<String> _errorMessages = [];
  Profile _profile;
  User _user;
  bool _loading = false;
  bool get loading => _loading;
  Profile get getProfile => _profile;
  User get getUser => _user;
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
        _errorMessages.clear();
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

  void setUser(val) {
    _user = val;
    print("setUser ${_user}");
    notifyListeners();
  }

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
        print(data['result']);
        User newUser = User.fromJson(data['result']);
        setUser(newUser);

        print(newUser.profile.isMobileVerified);
        print(newUser.profile.userName);
        print(newUser.profile.mobile);
        print('hhhhhhhhh');
        print(newUser.token);
        print(newUser.refreshToken);
        LocalStorage().saveUser(user: newUser);
        navigatorKey.currentState.pushNamed(LandScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        _errorMessages.clear();
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

  //Resend OTP if mobile not verified yet
  void resendOtpWithMobile({String mobileWithCode}) async {
    print(mobileWithCode);
    await authenticationServices
        .resendOtpWithMobile(codeConcatenateMobile: mobileWithCode)
        .then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {
        print(data['result']);
        Profile newProfile = Profile.fromJson(data['result']);
        //print(profile.token);
        setProfile(newProfile);
        setLoading(false);

        print(_profile.isMobileVerified);
        print(_profile.userName);
        print(_profile.mobile);
        print('hhhhhhhhh');
        //navigatorKey.currentState.pushNamed(LandScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        _errorMessages.clear();
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

  //LOGIN PROVIDER
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
        LocalStorage().saveUser(user: _user);
        navigatorKey.currentState.pushNamed(LandScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        _errorMessages.clear();
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

  Future<List<String>> forgotPasswordByMobile({String mobileWithCode}) async {
    // registerData.forEach((_, value) {
    //   print("value ${value}");
    // });
    List<String> arr = [];
    Map<String, dynamic> body = {"code": "", "mobile": mobileWithCode};
    print(mobileWithCode);
    setLoading(true);
    await authenticationServices.forgotPasswordByMobile(body).then((response) {
      //arr.clear();
      _errorMessages.clear();
      final data = json.decode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {
        String userOtp = data['result']['otp'].toString();
        String userId = data['result']['userId'].toString();
        arr.add(userOtp);
        arr.add(userId);
        print("userOtp => ${userOtp}");
        setLoading(false);
      } else if (data['success'] == false && data['errors'] != null) {
        _errorMessages.clear();
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
        navigatorKey.currentState.pushNamed(SignInScreen.routeName);
      } else {
        setLoading(false);
        Fluttertoast.showToast(
          msg: "Failed to get verification code",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink.shade400,
          textColor: Colors.white,
          fontSize: 15.0,
        );

        navigatorKey.currentState.pushNamed(SignInScreen.routeName);
      }
    });
    return arr;
  }

  resetPasswordByMobile({
    String code,
    int userId,
    String newPassword,
    String conformPassword,
  }) async {
    print("code ${code} ");
    print(" userId: ${userId} ");
    print("newPassword: ${newPassword}");
    print("confirmPassword ${conformPassword}");
    Map<String, dynamic> body = {
      "code": code,
      "userId": userId,
      "newPassword": newPassword,
      "confirmPassword": conformPassword
    };
    https: //moneyappapi.azurewebsites.net/api/v1/identity/resetpassword
    setLoading(true);
    await authenticationServices.resetNewPassword(body).then((response) {
      final data = json.decode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] == null) {
        Fluttertoast.showToast(
          msg: "Password has been changed successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink.shade400,
          textColor: Colors.white,
          fontSize: 15.0,
        );
        setLoading(false);
        navigatorKey.currentState.pushNamed(SignInScreen.routeName);
      } else if (data['success'] == false && data['errors'] != null) {
        if (_errorMessages != null) _errorMessages.clear();
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
          msg: "Failed to reset new password",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink.shade400,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    });
  }
}
