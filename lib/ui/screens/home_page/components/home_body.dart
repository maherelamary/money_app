import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

import 'answer_container.dart';
import 'question_container.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 10.0,
            left: 6.0,
            right: 6.0,
            bottom: 2.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(28),
            ),
          ),
          child: Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      height: 10.0,
                      width: 10.0,
                      color: ColorPalettes.secondaryColor,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      height: 10.0,
                      width: 10.0,
                      color: ColorPalettes.primaryColor,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      height: 10.0,
                      width: 10.0,
                      color: ColorPalettes.lightColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                QuestionContainer(),
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                    alignment: Alignment.topCenter,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        if (index <= 9) {
                          return AnswerContainer();
                        }
                        return null;
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
