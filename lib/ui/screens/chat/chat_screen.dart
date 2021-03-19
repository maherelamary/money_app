import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/chat_model.dart';
import 'package:money_app/ui/screens/chat/components/message_wall.dart';
import 'package:money_app/ui/screens/chat/components/send_message.dart';

import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/chat";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatModel chatModel = ChatModel();

  final List<ChatMessage> chatList = [];
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration(milliseconds: 1), () {
    //   chatModel.getVendorUserChatList();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    chatModel = Provider.of<ChatModel>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text(
          'Chatting',
          style: TextStyle(
            color: Colors.white24,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessageWall(),
          ),
          Container(
            child: SendMessageContainer(
              onSubmit: (msg) {
                print(msg);
              },
            ),
          ),
        ],
      ),
    );
  }
}
