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
  VendorChatProvider vendorChatProvider = VendorChatProvider();
  ScrollController scrollController = ScrollController();
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
    var previousAuthor = vendorChatProvider.chatsList[index - 1].authorId;
    var currentAuthor = vendorChatProvider.chatsList[index].authorId;
    return (previousAuthor != currentAuthor);
  }

  refresh() {
    setState(() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vendorChatProvider.getVendorUserChatList(),
      builder: (context, snap) {
        if (snap.data != null) {
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
                    reverse: false,
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: snap.data.length != null ? snap.data.length : 0,
                    itemBuilder: (_, i) {
                      ChatMessage currentMessage = snap.data[i];
                      if (currentMessage.authorId == null) {
                        return MyMessage(
                          message: snap.data[i],
                          showAvatar: shouldDisplayAvatar(i),
                        );
                      } else {
                        return OthersMessage(
                          message: snap.data[i],
                          showAvatar: shouldDisplayAvatar(i),
                        );
                      }
                    }),
              ),
            ],
          );
        } else {
          return Center(child: Text("No data"));
        }
      },
    );
  }
}
