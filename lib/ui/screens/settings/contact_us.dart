import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class ContactUsScreen extends StatefulWidget {
  static String routeName = '/contact_us';
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final nameTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final messageTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 180,
                child: Image.asset(
                  ImagesAsset.contactUs,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18.0,
                              color: ColorPalettes.borderColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: 40,
                            child: TextField(
                              controller: nameTextFieldController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorPalettes.borderColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Phone',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18.0,
                            color: ColorPalettes.borderColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: phoneTextFieldController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorPalettes.borderColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18.0,
                            color: ColorPalettes.borderColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: emailTextFieldController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorPalettes.borderColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Message',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18.0,
                            color: ColorPalettes.borderColor,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 100,
                          child: TextField(
                            controller: messageTextFieldController,
                            maxLines: 12,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorPalettes.borderColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: RaisedButton(
                    disabledColor: ColorPalettes.secondaryColor,
                    color: ColorPalettes.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(
                        color: ColorPalettes.borderColor.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Text(
                            'Send',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ImageIcon(
                          AssetImage(ImagesAsset.sendIcon),
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ],
                    ),
                    onPressed: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
