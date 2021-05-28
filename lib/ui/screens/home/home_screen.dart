import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money_app/core/model/quiz.dart';
import 'package:money_app/core/model/user.dart';
import 'package:money_app/core/viewModel/login_model.dart';
import 'package:money_app/core/viewModel/quiz_model.dart';
import 'package:money_app/ui/screens/home/components/answer_container.dart';
import 'package:money_app/ui/screens/home/components/home_header.dart';
import 'package:money_app/ui/screens/winner/prize.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user;
  Quiz quiz = Quiz();
  LoginModel loginModel = LoginModel();
  QuizModel quizModel = QuizModel();
  TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (user == null) {
        setState(() {
          print('ffrom init');
          user = loginModel.getUser;
        });
        try {
          await quizModel.getCurrentQuiz(userToken: user.token);
          //await quizModel.fetchUsersAnswers(userToken: user.token);
          setState(() {
            print('quiz ${quiz}');
            quiz = quizModel.getQuiz;
            print('quiz ${quiz}');
          });
        } catch (err) {
          print("SORRY, BUT IAM AN ERROR");
          print(err);
        }
      } else {
        print('ffffrom init');
        await quizModel.getCurrentQuiz(userToken: user.token);
        //await quizModel.fetchUsersAnswers(userToken: user.token);
        setState(() {
          quiz = quizModel.getQuiz;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loginModel = Provider.of<LoginModel>(context);
    quizModel = Provider.of<QuizModel>(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          //physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              delegate: CollapsedPersistentHeader(
                widget: HomeHeader(
                  user: user,
                ),
              ),
            ),
            quizModel.isLoading
                ? SliverToBoxAdapter(
                    child: Container(
                      height: 240,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                      ),
                    ),
                  )
                : SliverPersistentHeader(
                    pinned: true,
                    delegate: PersistentHeader(
                      widget: quiz == null
                          ? Center(
                              child: Text(
                                '.No question provided at a time.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorPalettes.appBreakColor,
                                  fontSize: 23.0,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            )
                          : _buildQuestionContainer(),
                    ),
                  ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              sliver: quizModel.isLoading
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        // Don't know what to do here
                        (context, index) {
                          if (quizModel.getUsersAnswers != null) {
                            quizModel.getUsersAnswers.forEach((answer) {
                              return AnswerContainer(answer: answer);
                            });
                          }
                          return null;
                        },
                      ),
                    ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No more answers",
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Cairo'),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    ImageIcon(
                      AssetImage(ImagesAsset.heartsIcon),
                      color: ColorPalettes.appAccentColor,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            AppLocalizations.of(context).currentQuestionLabel,
            textAlign: TextAlign.start,
            softWrap: true,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              color: ColorPalettes.appColor,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.0,
                child: Image.asset(
                  ImagesAsset.prizeIcon,
                  height: 30.0,
                  width: 30.0,
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: 60.0,
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                    child: Center(
                        child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: quiz != null ? quiz.quizDigit : 0,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: 0.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Icon(
                            Icons.star,
                            color: ColorPalettes.appBorderColor,
                            size: 35.0,
                          ),
                        );
                      },
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PrizeScreen.routeName,
                  );
                },
                child: Image.asset(
                  ImagesAsset.prizeIcon,
                  height: 30.0,
                  width: 30.0,
                ),
              ),
            ],
          ),
          Spacer(),
          _buildInputAnswerContainer(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

// ignore: camel_case_types
  Widget _buildInputAnswerContainer() {
    return Card(
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
                controller: _answerController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).postAnswerLabel,
                  hintStyle: TextStyle(fontSize: 16, fontFamily: "Cairo"),
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
                  fillColor: Colors.white.withOpacity(0.4),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  suffixIcon: IconButton(
                    color: ColorPalettes.appColor,
                    icon: Icon(
                      Icons.send_outlined,
                      size: 20,
                      color: ColorPalettes.appAccentColor,
                    ),
                    onPressed: () {
                      if (_answerController.text == null ||
                          _answerController.text.isEmpty) {
                        return showAlertDialog(context);
                      } else {
                        quizModel
                            .postAnswer(
                                quizId: quiz.quizId,
                                answer: int.parse(_answerController.text),
                                userToken: user.token)
                            .then((_) {
                          _answerController.clear();
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Notifing",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: "Cairo",
        ),
      ),
      content: Text(
        "Answer can't be empty",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: "Cairo",
        ),
      ),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      //height: 260.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 2.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 240;

  @override
  double get minExtent => 240;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CollapsedPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  CollapsedPersistentHeader({
    this.widget,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      //height: 260.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
