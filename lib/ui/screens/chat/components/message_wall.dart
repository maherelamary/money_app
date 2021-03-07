import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/chat_model.dart';
import 'package:money_app/ui/widgets/my_messages.dart';
import 'package:money_app/ui/widgets/others_message.dart';
import 'package:provider/provider.dart';

class MessageWall extends StatefulWidget {
  @override
  _MessageWallState createState() => _MessageWallState();
}

class _MessageWallState extends State<MessageWall> {
  ChatModel chatModel = ChatModel();

  ScrollController scrollController = ScrollController();

  final chatRef = FirebaseDatabase.instance.reference().child('CHATTING');

  String currentQuestionId = '13';

  List<ChatMessage> chatList = List<ChatMessage>();
  @override
  void initState() {
    // TODO: implement initState
    refresh();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool shouldDisplayAvatar(int index) {
    if (index == 0) return true;
    var previousAuthor = chatList[index - 1].authorId;
    var currentAuthor = chatList[index].authorId;
    return (previousAuthor != currentAuthor);
  }

  refresh() {
    setState(() {
      if (scrollController.hasClients)
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    chatModel = Provider.of<ChatModel>(context);

    return StreamBuilder(
        stream: chatRef.child(currentQuestionId).onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            chatList.clear();
            DataSnapshot snapshot = snap.data.snapshot;
            Map<dynamic, dynamic> returnedJson = snapshot.value;
            returnedJson.forEach((_, value) {
              ChatMessage _msg = ChatMessage.fromSnapshot(value);
              chatList.add(_msg);
            });
            chatList
              ..sort((a, b) => DateTime.parse(
                    chatModel.replaceFarsiNumber(
                      a.timeStamp
                          .toString()
                          .replaceAll("ص", "")
                          .replaceAll("م", ""),
                    ),
                  ).compareTo(DateTime.parse(chatModel.replaceFarsiNumber(b
                      .timeStamp
                      .toString()
                      .replaceAll("ص", "")
                      .replaceAll("م", "")))));
          }
          return Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Current Question",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: chatList != null ? chatList.length : 0,
                    itemBuilder: (_, i) {
                      ChatMessage _msg = chatList[i];
                      if (true) {
                        return MyMessage(
                          message: _msg,
                          showAvatar: shouldDisplayAvatar(i),
                        );
                      } else {
                        return OthersMessage(
                          message: _msg,
                          showAvatar: shouldDisplayAvatar(i),
                        );
                      }
                    }),
              ),
            ],
          );
        });
  }
}
