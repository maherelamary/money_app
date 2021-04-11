import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class BuildTimer extends StatefulWidget {
  final ValueChanged<bool> timerHasEnded;
  BuildTimer({this.timerHasEnded});

  @override
  _BuildTimerState createState() => _BuildTimerState();
}

class _BuildTimerState extends State<BuildTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 10.0, end: 0.0),
        duration: Duration(seconds: 10),
        builder: (_, value, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Add Your Code here.
            if (value.toInt() == 0) {
              widget.timerHasEnded(true);
              print('yes it\'s ended');
            } else {
              widget.timerHasEnded(false);
            }
          });

          return Text(
            "00:${value.toInt()}",
            style: TextStyle(color: ColorPalettes.appColor),
          );
        },
      ),
    );
  }
}
