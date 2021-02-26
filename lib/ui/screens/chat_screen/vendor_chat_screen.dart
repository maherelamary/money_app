import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/chat_model.dart';
import 'package:money_app/ui/screens/chat_screen/components/message_wall.dart';
import 'package:money_app/ui/screens/chat_screen/components/send_message.dart';
import 'package:provider/provider.dart';

class VendorChatScreen extends StatefulWidget {
  @override
  _VendorChatScreenState createState() => _VendorChatScreenState();
}

class _VendorChatScreenState extends State<VendorChatScreen> {
  VendorChatProvider vendorChatProvider = VendorChatProvider();

  final List<ChatMessage> chatList = [];
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 1), () {
      vendorChatProvider.getVendorUserChatList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vendorChatProvider = Provider.of<VendorChatProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Text('Chat Screen'),
        centerTitle: true,
        elevation: 2.0,
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
