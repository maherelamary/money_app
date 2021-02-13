import "package:flutter/material.dart";
import 'package:money_app/screens/home_page/components/info_container.dart';
import 'package:money_app/screens/home_page/components/question_container.dart';
import 'package:money_app/screens/home_page/components/answer_container.dart';
import 'package:money_app/utils/color_palettes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        gradient: ColorPalettes.primaryGradientColor,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 230.0,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://picsum.photos/250?image=9",
                                ),
                                radius: 50.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Abdelrahman",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
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
                      elevation: 3.0,
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 10.0),
                              alignment: Alignment.topCenter,
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  if (index <= 9) {
                                    return AnswerContainer();
                                  }
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
              ],
            ),
            Positioned(
              top: 190,
              left: 10.0,
              right: 10.0,
              child: InfoContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
