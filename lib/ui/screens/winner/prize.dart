import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class PrizeScreen extends StatelessWidget {
  static String routeName = '/prize';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        elevation: 3.0,
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: 25.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorPalettes.appColor,
              ColorPalettes.appAccentColor,
            ],
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Laptop Dell E34245',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Image.asset(
                    ImagesAsset.coin,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  '15,000 Dollars',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: ColorPalettes.appBorderColor,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                SingleChildScrollView(
                  child: Container(
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Colors.grey.shade500,
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
