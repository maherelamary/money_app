import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: ColorPalettes.primaryGradientColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    AppLocalizations.of(context).contactUsLabel,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
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
                              AppLocalizations.of(context).nameLabel,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18.0,
                                color: ColorPalettes.appBreakColor,
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
                                      color: ColorPalettes.appBreakColor,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            AppLocalizations.of(context).phoneNumberLabel,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18.0,
                              color: ColorPalettes.appBreakColor,
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
                                    color: ColorPalettes.appBreakColor,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            AppLocalizations.of(context).emailLabel,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18.0,
                              color: ColorPalettes.appBreakColor,
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
                                    color: ColorPalettes.appBreakColor,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            AppLocalizations.of(context).messageLabel,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18.0,
                              color: ColorPalettes.appBreakColor,
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
                                    color: ColorPalettes.appBreakColor,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 10.0,
                    ),
                    child: RaisedButton(
                      disabledColor: ColorPalettes.appAccentColor,
                      color: ColorPalettes.appAccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: BorderSide(
                          color: ColorPalettes.appBreakColor,
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
                              AppLocalizations.of(context).sendLabel,
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
      ),
    );
  }
}
