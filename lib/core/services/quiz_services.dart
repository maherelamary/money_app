import 'dart:convert';
import 'package:money_app/core/api_config.dart';
import 'package:http/http.dart' as http;

class QuizServices {
  static String quiz = "v1/Quizes/Get";
  static String answer = "v1/Quizes/Answer";
  static String answers = "v1/Quizes/GetAnswers";
  static String getQuizEndpoint = ApiConfig.baseApiUrl + quiz;
  static String postAnswerEndpoint = ApiConfig.baseApiUrl + answer;
  static String getAnswersEndpoint = ApiConfig.baseApiUrl + answers;

  Future<http.Response> currentQuiz(String userToken) async {
    print('Url => $getQuizEndpoint');
    return await http.get(
      getQuizEndpoint,
      headers: {
        'authorization': authToken(userToken: userToken),
        'Content-Type': 'application/json',
      },
    );
  }

  Future<http.Response> postAnswer(
      Map<String, dynamic> body, String userToken) async {
    print(userToken);
    print('Url => $postAnswerEndpoint');
    return await http.post(
      postAnswerEndpoint,
      headers: {
        'authorization': authToken(userToken: userToken),
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> getAnswers(String userToken) async {
    print('Url => $getAnswersEndpoint');
    return await http.get(
      getAnswersEndpoint,
      headers: {
        'authorization': authToken(userToken: userToken),
        'Content-Type': 'application/json',
      },
    );
  }

  String authToken({String userToken}) => "Bearer ${userToken}";
}
