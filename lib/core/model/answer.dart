import 'dart:convert';

Answer AnswerFromJson(String str) => Answer.fromJson(json.decode(str));

String AnswerToJson(Answer data) => json.encode(data.toJson());

class Answer {
  Answer({
    this.id,
    this.memberId,
    this.memberDisplayName,
    this.memberPhoto,
    this.answer,
  });

  int id;
  int memberId;
  String memberDisplayName;
  dynamic memberPhoto;
  int answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        memberId: json["memberId"],
        memberDisplayName: json["memberDisplayName"],
        memberPhoto: json["memberPhoto"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "memberId": memberId,
        "memberDisplayName": memberDisplayName,
        "memberPhoto": memberPhoto,
        "answer": answer,
      };
}
