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
    this.imageUrl = "https://placeholder.it/100x100",
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

class VendorChatProvider extends ChangeNotifier {
  List<ChatMessage> chatsList = [];
  // bool _loadingChats = false;
  // bool get loadingChats => _loadingChats;

  final ref = FirebaseDatabase.instance.reference().child('vendor_user_chat');

  Future<List<ChatMessage>> getVendorUserChatList() async {
    chatsList = [];
    print("getVendorUserChatList()");
    DataSnapshot snap =
        await ref.child("currentQuestion").child("player").once();
    if (snap.value != null) {
      Map<dynamic, dynamic> values = snap.value;
      values.forEach((_, query) {
        var _message = ChatMessage.fromSnapshot(query);
        chatsList.add(_message);
      });
      chatsList
        ..sort((a, b) => DateTime.parse(replaceFarsiNumber(
                b.timeStamp.toString().replaceAll("ص", "").replaceAll("م", "")))
            .compareTo(DateTime.parse(replaceFarsiNumber(a.timeStamp
                .toString()
                .replaceAll("ص", "")
                .replaceAll("م", "")))));

      return chatsList;
    } else {
      return <ChatMessage>[];
    }
  }

  void pushMessageToDatabase(
    ChatMessage msg,
  ) {
    var key = ref.push().key;
    ref.child("Current Question").child("playerId").child(key).set(msg.toMap());
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

  // Future<void> getMessage() async {
  //   _messageDatabaseReference.onChildAdded.listen((event) async {
  //     Map<dynamic, dynamic> result =
  //         (await _all_messages.child(event.snapshot.key).once()).value;
  //
  //     setState(() {
  //       lists.add(result);
  //       lists
  //         ..sort((a, b) => DateTime.parse(replaceFarsiNumber(b['Message_Time']
  //             .toString()
  //             .replaceAll("ص", "")
  //             .replaceAll("م", "")))
  //             .compareTo(DateTime.parse(replaceFarsiNumber(a['Message_Time']
  //             .toString()
  //             .replaceAll("ص", "")
  //             .replaceAll("م", "")))));
  //     });
  //   });
  //   print("Listssss " + lists.length.toString());
  // }
}
