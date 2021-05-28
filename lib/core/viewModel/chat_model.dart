import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  String author;
  String authorId;
  String message;
  String timeStamp;
  String imageUrl;
  String isVendor;
  ChatMessage({
    this.author,
    this.authorId,
    this.message,
    this.timeStamp,
    this.imageUrl = "https://picsum.photos/250?image=9",
    this.isVendor = 'true',
  });

  ChatMessage.fromSnapshot(snapshot)
      : author = snapshot['author'],
        authorId = snapshot['author_id'],
        message = snapshot['message'],
        timeStamp = snapshot['time_stamp'],
        imageUrl = snapshot['image_url'],
        isVendor = snapshot['isVendor'];

  Map<dynamic, dynamic> toMap() => {
        "image_url": imageUrl,
        "author": author,
        "author_id": authorId,
        "message": message,
        "time_stamp": timeStamp,
        "isVendor": isVendor,
      };
}

class ChatModel extends ChangeNotifier {
  final ref = FirebaseDatabase.instance.reference().child('CHATTING');

  void pushMessageToDatabase(
    ChatMessage msg,
  ) {
    var key = ref.push().key;
    ref.child("13").child(key).set(msg.toMap());
    notifyListeners();
  }

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }
}
