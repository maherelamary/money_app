import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/core/services/authentication_services.dart';

class SignUpModel extends ChangeNotifier {
  List<String> _errorMessages = [];
  bool _loading;
  bool get loading => _loading;

  AuthenticationServices authenticationServices = AuthenticationServices();
  void registerMobile({Map registerData}) async {
    registerData.forEach((_, value) {
      print("value ${value}");
    });

    await authenticationServices
        .registerWithMobile(registerData)
        .then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {}
      if (data['success'] == false && data['errors'] != null) {
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
      }
    });
  }
}
