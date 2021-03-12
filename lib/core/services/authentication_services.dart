import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:money_app/core/api_config.dart';

class AuthenticationServices {
  static String registerMobile = 'v1/identity/RegisterMobile';
  static String loginMobile = 'v1/identity/login';
  static String verifyMobile = 'v1/identity/verifymobile';
  static String registerMobileEndpoint = ApiConfig.baseApiUrl + registerMobile;
  static String loginMobileEndpoint = ApiConfig.baseApiUrl + loginMobile;
  static String verifyMobileEndpoint = ApiConfig.baseApiUrl + verifyMobile;

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
}
