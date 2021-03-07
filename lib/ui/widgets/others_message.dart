import 'package:flutter/material.dart';
import 'package:money_app/core/viewModel/chat_model.dart';

class OthersMessage extends StatefulWidget {
  final ChatMessage message;
  final bool showAvatar;

  OthersMessage({
    this.message,
    this.showAvatar = true,
  });

  @override
  _OthersMessageState createState() => _OthersMessageState();
}

class _OthersMessageState extends State<OthersMessage> {
  List<Color> _colors = [
    Color(0xffead2d4),
    Color(0xffe5c8cb),
    Color(0xffffafbd),
    Color(0xffffd3b5),
    Color(0xffeab9d2),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.showAvatar
                  // ? CircleAvatar(
                  //     backgroundImage: NetworkImage(
                  //       widget.message.imageUrl,
                  //     ),
                  //   )
                  ? _buildCustomAvatar()
                  : SizedBox(
                      width: 60.0,
                    ),
              SizedBox(
                width: 5.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 12.0,
                ),
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAvatar() {
    return Container(
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        color: (_colors..shuffle()).first,
      ),
      child: Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            widget.message.imageUrl,
          ),
        ),
      ),
    );
  }
}
