import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl_standalone.dart';
import 'package:money_app/core/services/authentication_services.dart';

class SignUpModel extends ChangeNotifier {
  List<String> errors = List<String>();

  AuthenticationServices authenticationServices = AuthenticationServices();
  void registerMobile({Map registerData}) async {
    final response = await authenticationServices.registermobile(registerData);
    final responseData = jsonDecode(response.body);

    if (responseData['success'] == true &&
        responseData['errors'] != null &&
        responseData['result'] != null) {}
    if (responseData['success'] == false && responseData['errors'] == null) {
      responseData['errors'].forEach((err) {
        errors.add(err['description']);
        Fluttertoast.showToast(
            msg: errors.first,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }
}
