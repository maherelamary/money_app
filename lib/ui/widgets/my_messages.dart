import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/chat_model.dart';

class MyMessage extends StatefulWidget {
  final ChatMessage message;
  final bool showAvatar;

  MyMessage({
    this.message,
    this.showAvatar,
  });

  @override
  _MyMessageState createState() => _MyMessageState();
}

class _MyMessageState extends State<MyMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 12.0,
            ),
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.message.author,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 11.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.message.message,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          widget.showAvatar
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.message.imageUrl,
                  ),
                )
              : SizedBox(
                  width: 40.0,
                ),
        ],
      ),
    );
  }
}
