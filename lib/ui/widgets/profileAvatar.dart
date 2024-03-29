import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';
import 'package:money_app/utils/sizes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class ProfileAvatar extends StatefulWidget {
  final bool editable;
  final ValueChanged<File> onChanged;
  ProfileAvatar({
    Key key,
    this.editable = false,
    this.onChanged,
  }) : super(key: key);
  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  void chooseImage(ImageSource source) async {
    final pickedImageFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = File(pickedImageFile.path);
      widget.onChanged(_imageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: _imageFile == null
                ? AssetImage(
                    ImagesAsset.profile,
                  )
                : FileImage(
                    _imageFile,
                  ),
          ),
          widget.editable
              ? Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                        color: Colors.white60,
                      ),
                      onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: ((builder) => _imageSelectorBottomSheet()),
                          ) //TODO_openImageSelector,
                      ),
                )
              : Container(height: 0.0, width: 0.0),
        ],
      ),
    );
  }

  Widget _imageSelectorBottomSheet() {
    return Container(
      height: 150.0,
      width: Sizes.width(context),
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: ColorPalettes.appAccentColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(context),
            Expanded(
              child: InkWell(
                onTap: () {
                  chooseImage(ImageSource.gallery);
                },
                child: _buildListItem(
                  context,
                  title: Text(AppLocalizations.of(context).galleryButton),
                  leading: Icon(
                    Icons.camera,
                    color: ColorPalettes.appBreakColor,
                  ),
                ),
              ),
            ),
            Divider(
              color: ColorPalettes.appAccentColor,
              thickness: 1.5,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  chooseImage(ImageSource.camera);
                },
                child: _buildListItem(
                  context,
                  title: Text(AppLocalizations.of(context).cameraButton),
                  leading: Icon(
                    Icons.camera_alt,
                    color: ColorPalettes.appBreakColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    Widget title,
    Widget leading,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (leading != null) leading,
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: DefaultTextStyle(
                child: title,
                style: TextStyle(
                    color: Colors.black87, fontSize: Sizes.dp18(context)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: ColorPalettes.appAccentColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}

Future uploadImageFileToStorage({File imageToUpload}) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  final storageRef =
      FirebaseStorage.instance.ref().child('moneyApp').child(fileName);
  final task = await storageRef.putFile(imageToUpload);
  await task.ref.getDownloadURL().then((downloadedUrl) {
    //widget.onChanged(downloadedUrl.toString());
    print("_imageUrl => ${downloadedUrl}");
    return downloadedUrl.toString();
  }, onError: (err) {
    print('Err' + err);
    Fluttertoast.showToast(msg: 'This file is not an image');
  });
}
