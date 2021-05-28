import 'dart:async';
import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class CountDownInterval extends StatefulWidget {
  final Function whenIntervalExpires;
  final bool start;
  CountDownInterval({Key key, this.start, this.whenIntervalExpires})
      : super(key: key);

  @override
  _CountDownIntervalState createState() => _CountDownIntervalState();
}

class _CountDownIntervalState extends State<CountDownInterval> {
  Timer _timer;
  bool isStarted;
  int _interval = 30;

  @override
  void initState() {
    super.initState();
    if (widget.start) {
      startTimer();
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_interval == 0) {
          widget.whenIntervalExpires();
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _interval--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _interval.toString(),
        style: TextStyle(
          color: ColorPalettes.appColor,
          fontFamily: "Cairo",
          fontSize: 18.0,
        ),
      ),
    );
  }
}
