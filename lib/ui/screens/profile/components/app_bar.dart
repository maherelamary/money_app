import 'package:flutter/material.dart';
import 'package:money_app/ui/widgets/profileAvatar.dart';
import 'package:money_app/utils/color_palettes.dart';
import 'package:money_app/utils/images_asset.dart';

class ProfileAppBar extends StatefulWidget {
  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: _AppBarClipper(),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorPalettes.appColor,
                  ColorPalettes.appAccentColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blueGrey),
            ),
            // child: ClipOval(
            //   child: Image.asset(ImagesAsset.profile),
            // ),
            child: ProfileAvatar(),
          ),
        ),
      ],
    );
  }
}

class _AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    // path.lineTo(size.width / 2, size.height);
    // path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
