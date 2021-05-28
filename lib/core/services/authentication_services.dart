import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:money_app/core/api_config.dart';

class AuthenticationServices {
  static String registerMobile = 'v1/identity/RegisterMobile';
  static String loginMobile = 'v1/identity/login';
  static String verifyMobile = 'v1/identity/verifymobile';
  static String resendOtp = 'v1/identity/ResendOTP';
  static String forgotPassword = "v1/identity/forgotpasswordbymobile";
  static String resetPassword = "v1/identity/resetpassword";
  static String registerMobileEndpoint = ApiConfig.baseApiUrl + registerMobile;
  static String loginMobileEndpoint = ApiConfig.baseApiUrl + loginMobile;
  static String verifyMobileEndpoint = ApiConfig.baseApiUrl + verifyMobile;
  static String resendOtpEndpoint = ApiConfig.baseApiUrl + resendOtp;
  static String forgotPasswordEndpoint = ApiConfig.baseApiUrl + forgotPassword;
  static String newPasswordEndpoint = ApiConfig.baseApiUrl + resetPassword;

  Future<http.Response> registerWithMobile(Map<String, dynamic> body) async {
    print('Url => $registerMobileEndpoint');
    return await http.post(
      registerMobileEndpoint,
      headers: {
        //'authorization': auth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> loginWithMobile(Map<String, dynamic> body) async {
    print('Url => $loginMobileEndpoint');
    return await http.post(
      loginMobileEndpoint,
      headers: {
        //'authorization': auth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> verifyUserMobile(Map<String, dynamic> body) async {
    print('Url => $verifyMobileEndpoint');
    return await http.post(
      verifyMobileEndpoint,
      headers: {
        //'authorization': auth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> resendOtpWithMobile(
      {String codeConcatenateMobile}) async {
    print('Url => $verifyMobileEndpoint');
    Map<String, dynamic> body = {
      "memberId": 0,
      "code": "",
      "mobile": codeConcatenateMobile
    };
    return await http.post(
      resendOtpEndpoint,
      headers: {
        //'authorization': auth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> forgotPasswordByMobile(
      Map<String, dynamic> body) async {
    print('Url => $forgotPasswordEndpoint');
    return await http.post(
      forgotPasswordEndpoint,
      headers: {
        //'authorization': auth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> resetNewPassword(Map<String, dynamic> body) async {
    print('Url => $newPasswordEndpoint');
    return await http.post(
      newPasswordEndpoint,
      headers: {
        //'authorization': auth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }
}
