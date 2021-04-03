import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:money_app/utils/images_asset.dart';

class InfoContainer extends StatefulWidget {
  InfoContainer({Key key}) : super(key: key);

  @override
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 36.0, vertical: 10.0),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "60",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Changa',
                      color: ColorPalettes.lightColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).pointsLabel,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Cairo',
                        color: Colors.blueGrey,
                      ),
                    ),
                    Image.asset(
                      ImagesAsset.pointsIcon,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CountDownTimer(
                    secondsRemaining: 30,
                    whenTimeExpires: () {
                      setState(() {
                        //hasTimerStopped = true;
                      });
                    },
                    countDownTimerStyle: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Changa',
                      color: ColorPalettes.lightColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).timerLabel,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Cairo',
                        color: Colors.blueGrey,
                      ),
                    ),
                    Image.asset(
                      ImagesAsset.timerIcon,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key key,
    int secondsRemaining,
    this.countDownTimerStyle,
    this.whenTimeExpires,
    this.countDownFormatter,
  })  : secondsRemaining = secondsRemaining,
        super(key: key);

  final int secondsRemaining;
  final Function whenTimeExpires;
  final Function countDownFormatter;
  final TextStyle countDownTimerStyle;

  State createState() => new _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Duration duration;

  AudioPlayer player;
  static AudioCache cache = AudioCache();

  AnimationController _playerController;
  Duration playerDuration;

  String get timerDisplayString {
    Duration duration = _controller.duration * _controller.value;
    return widget.countDownFormatter != null
        ? widget.countDownFormatter(duration.inSeconds)
        : formatHHMMSS(duration.inSeconds);
  }

  playTicktock() async {
    player = await cache.play('assets/audio/ticktock.mp3');
  }

  @override
  void initState() {
    super.initState();
    playTicktock();
    duration = Duration(seconds: widget.secondsRemaining);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.reverse(from: widget.secondsRemaining.toDouble());
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        widget.whenTimeExpires();
      }
    });
  }

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = new Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = new AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller.reverse(from: widget.secondsRemaining.toDouble());
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.whenTimeExpires();
          } else if (status == AnimationStatus.dismissed) {
            print("Animation Complete");
          }
        });
      });
    }
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (_, Widget child) {
              return Text(
                timerDisplayString,
                style: widget.countDownTimerStyle,
              );
            }));
  }
}
