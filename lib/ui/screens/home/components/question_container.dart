import 'package:flutter/material.dart';
import 'package:money_app/ui/screens/home/components/info_container.dart';
import 'package:money_app/ui/screens/winner/prize.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.0),
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
          Text(
            "What's Your first second middle last sur Name ?",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
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
              _buildAnswerContainer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PrizeScreen.routeName);
                },
                child: Image.asset(
                  ImagesAsset.prizeIcon,
                  height: 30.0,
                  width: 30.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildInputAnswerContainer(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

class _buildInputAnswerContainer extends StatelessWidget {
  const _buildInputAnswerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                controller: null,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).postAnswerLabel,
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
              color: ColorPalettes.appColor,
              icon: Icon(
                Icons.send_outlined,
                size: 20,
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}

class _buildAnswerContainer extends StatelessWidget {
  const _buildAnswerContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        height: 50.0,
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
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
    );
  }
}
