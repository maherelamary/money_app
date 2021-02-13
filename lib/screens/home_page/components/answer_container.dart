import 'package:flutter/material.dart';

class AnswerContainer extends StatefulWidget {
  AnswerContainer({Key key}) : super(key: key);

  @override
  _AnswerContainerState createState() => _AnswerContainerState();
}

class _AnswerContainerState extends State<AnswerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade50,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 6.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Fahd9090",
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "19976",
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
