import 'package:flutter/material.dart';
import 'package:money_app/core/model/answer.dart';

class AnswerContainer extends StatefulWidget {
  final Answer answer;
  AnswerContainer({Key key, this.answer}) : super(key: key);

  @override
  _AnswerContainerState createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://picsum.photos/250?image=9",
            ),
            radius: 20.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Card(
            elevation: 2.0,
            color: Colors.blueGrey.shade50,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 6.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.answer.memberDisplayName,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.answer.answer.toString(),
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
