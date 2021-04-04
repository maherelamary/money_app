import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:money_app/ui/widgets/buttons/custom_rounded_rect_button.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'dart:ui' as ui;
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class WinnerScreen extends StatefulWidget {
  static String routeName = '/winnerbanner';
  WinnerScreen({Key key}) : super(key: key);

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  static GlobalKey _repaintKey = GlobalKey();
  File _image;
  bool loadingScreenShot = false;
  // ScreenshotController _screenshotController = ScreenshotController();
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RepaintBoundary(
                  key: _repaintKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 0.5, color: Colors.white70),
                          ),
                          height: 80.0,
                          width: 80.0,
                          child: Image.asset(
                            ImagesAsset.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: Image.asset(
                          ImagesAsset.winnerbanner,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 150.0,
                            width: 150.0,
                            child: Image.asset(
                              ImagesAsset.winnerborder,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 130.0,
                            width: 130.0,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage(
                                ImagesAsset.profile,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRoundedRectangleButton(
                      buttonTitle: "Back",
                      icon: Icons.arrow_back_ios_rounded,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CustomRoundedRectangleButton(
                      buttonTitle: "Share",
                      icon: Icons.share_sharp,
                      onPressed: () {
                        shareScreenshot();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> shareScreenshot() async {
    setState(() {
      loadingScreenShot = true;
    });
    try {
      RenderRepaintBoundary boundary =
          _repaintKey.currentContext.findRenderObject();
      if (boundary.debugNeedsPaint) {
        Timer(Duration(seconds: 1), () => shareScreenshot());
        return null;
      }
      ui.Image image = await boundary.toImage();
      final directory = (await getExternalStorageDirectory()).path;
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      final RenderBox box = context.findRenderObject();
      Share.shareFiles([File('$directory/screenshot.png').path],
          subject: 'Share ScreenShot',
          text: 'Hello, check your share files!',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
    setState(() {
      loadingScreenShot = false;
    });
  }
  // _image = await _screenshotController.capture(
  //     pixelRatio: 2.0, delay: Duration(milliseconds: 10));
  // final Uint8List bytes = _image.readAsBytesASync();
  // await Share.file(
  //     'Order Screenshot', 'ss.png', bytes.buffer.asUint8List(), 'image/png');
  //     .then((image) async {
  //   final directory = (await getApplicationDocumentsDirectory()).path;
  //   Uint8List pngBytes = _imageFile.readAsBytesSync();
  //   File imgFile = File('$directory/screenshot.png');
  //   imgFile.writeAsBytes(pngBytes);
  //   print('file saved in gallery');
  //   await Share.file(
  //       "Money App", "We have a winner here", pngBytes, 'image/png');
  // }).catchError((onError) {
  //   print(onError);
  // });
}
