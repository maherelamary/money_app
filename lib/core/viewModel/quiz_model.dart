import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_app/core/model/answer.dart';
import 'package:money_app/core/model/quiz.dart';
import 'package:money_app/core/services/quiz_services.dart';
import 'package:money_app/utils/color_palettes.dart';

class QuizModel extends ChangeNotifier {
  List<String> _errorMessages = [];
  List<Answer> _usersAnswers = [];
  bool _loading = false;
  Quiz _quiz;
  QuizServices quizServices = QuizServices();

  void setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  void setQuiz(val) {
    _quiz = val;
    notifyListeners();
  }

  Quiz get getQuiz => _quiz;
  List<Answer> get getUsersAnswers => _usersAnswers;
  bool get isLoading => _loading;

  Future<void> getCurrentQuiz({String userToken}) async {
    print("getCurrentQuiz initialized");
    print("value ${userToken}");
    setLoading(true);
    await quizServices.currentQuiz(userToken).then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');

      if (data['success'] == true &&
          data['errors'] == null &&
          data['result'] != null) {
        Quiz quiz = Quiz.fromJson(data['result']['currentQuiz']);
        setQuiz(quiz);
        setLoading(false);
        print(_quiz.quizId);
        print(_quiz.quizDigit);
        print(_quiz.quizPrizeAmount);
        print(_quiz.quizPrizeName);
        print(_quiz.quizPrizeImage);
        print(_quiz.quizPrizeDisplayNameAr);
        print(_quiz.quizPrizeDisplayNameEn);
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
            backgroundColor: ColorPalettes.appAccentColor,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        });
      } else {
        setLoading(false);
        Fluttertoast.showToast(
          msg: "Error has been occured",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: ColorPalettes.appAccentColor,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    }).catchError((err) {
      print("SORRY, BUT IAM AN ERROR");
      Fluttertoast.showToast(
        msg: "Error has been occured",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: ColorPalettes.appAccentColor,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    });
  }

  Future<void> postAnswer({int quizId, int answer, String userToken}) async {
    Map<String, dynamic> registerData = {"quizId": quizId, "answer": answer};
    setLoading(true);
    await quizServices.postAnswer(registerData, userToken).then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['statusCode'] == 200 &&
          data['success'] == true &&
          data['errors'] == null &&
          data['result'] == null) {
        Fluttertoast.showToast(
          msg: "Your answer has been submitted",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: ColorPalettes.appAccentColor,
          textColor: Colors.white,
          fontSize: 15.0,
        );
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
            backgroundColor: ColorPalettes.appAccentColor,
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
          backgroundColor: ColorPalettes.appAccentColor,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    }).catchError((err) {
      print("SORRY, BUT IAM AN ERROR");
      Fluttertoast.showToast(
        msg: "Error has been occured",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: ColorPalettes.appAccentColor,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    });
  }

  Future<void> fetchUsersAnswers({String userToken}) async {
    setLoading(true);
    await quizServices.getAnswers(userToken).then((response) {
      _errorMessages.clear();
      final data = jsonDecode(response.body);
      print('data Retrieved ${data}');
      if (data['statusCode'] == 200 &&
          data['success'] == true &&
          data['errors'] == null &&
          data['result'] == null) {
        List answers = data['result']['items'];
        answers.forEach((answer) {
          Answer userAnswer = Answer.fromJson(answer);
          _usersAnswers.add(userAnswer);
        });
        setLoading(false);
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
            backgroundColor: ColorPalettes.appAccentColor,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        });
      } else {
        setLoading(false);
        Fluttertoast.showToast(
          msg: "PLEASE, REFRESH",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: ColorPalettes.appAccentColor,
          textColor: Colors.white,
          fontSize: 15.0,
        );
      }
    }).catchError((err) {
      print("SORRY, BUT IAM AN ERROR");
      Fluttertoast.showToast(
        msg: "Error has been occured",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: ColorPalettes.appAccentColor,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    });
  }
}
