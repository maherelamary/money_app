import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    this.quizId,
    this.quizDigit,
    this.quizPrizeId,
    this.quizPrizeName,
    this.quizPrizeDisplayNameAr,
    this.quizPrizeDisplayNameEn,
    this.quizPrizeAmount,
    this.quizPrizeImage,
    this.startDateUtc,
    this.endDateUtc,
  });

  int quizId;
  int quizDigit;
  int quizPrizeId;
  String quizPrizeName;
  String quizPrizeDisplayNameAr;
  String quizPrizeDisplayNameEn;
  double quizPrizeAmount;
  dynamic quizPrizeImage;
  DateTime startDateUtc;
  DateTime endDateUtc;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        quizId: json["quizId"],
        quizDigit: json["quizDigit"],
        quizPrizeId: json["quizPrizeId"],
        quizPrizeName: json["quizPrizeName"],
        quizPrizeDisplayNameAr: json["quizPrizeDisplayNameAr"],
        quizPrizeDisplayNameEn: json["quizPrizeDisplayNameEn"],
        quizPrizeAmount: json["quizPrizeAmount"],
        quizPrizeImage: json["quizPrizeImage"],
        startDateUtc: DateTime.parse(json["startDateUtc"]),
        endDateUtc: DateTime.parse(json["endDateUtc"]),
      );

  Map<String, dynamic> toJson() => {
        "quizId": quizId,
        "quizDigit": quizDigit,
        "quizPrizeId": quizPrizeId,
        "quizPrizeName": quizPrizeName,
        "quizPrizeDisplayNameAr": quizPrizeDisplayNameAr,
        "quizPrizeDisplayNameEn": quizPrizeDisplayNameEn,
        "quizPrizeAmount": quizPrizeAmount,
        "quizPrizeImage": quizPrizeImage,
        "startDateUtc": startDateUtc.toIso8601String(),
        "endDateUtc": endDateUtc.toIso8601String(),
      };
}
