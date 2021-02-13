import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class QuestionContainer extends StatefulWidget {
  @override
  _QuestionContainerState createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          /*  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, */
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Current Question',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: ColorPalettes.thirdColor),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "What's Your first second middle last sur Name ?",
              textAlign: TextAlign.left,
              softWrap: true,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 2.0,
              child: Container(
                height: 40.0,
                width: 180.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.blueGrey.shade100,
                      size: 30.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.blueGrey.shade100,
                      size: 30.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.blueGrey.shade100,
                      size: 30.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.blueGrey.shade100,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 4.0,
              child: Container(
                height: 40.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: null,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Publish answer ...',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          fillColor: Colors.blueGrey.shade100,
                        ),
                      ),
                    ),
                    IconButton(
                        color: ColorPalettes.thirdColor,
                        icon: Icon(
                          Icons.send_outlined,
                          size: 20,
                        ),
                        onPressed: null)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
