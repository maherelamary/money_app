import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class CountDownTimer extends StatefulWidget {
  CountDownTimer({Key key}) : super(key: key);

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "00:00",
        style: TextStyle(
          color: ColorPalettes.appColor,
          fontFamily: "Cairo",
          fontSize: 18.0,
        ),
      ),
    );
  }
}
// class CountDownTimer extends StatefulWidget {
//   const CountDownTimer({
//     Key key,
//     int secondsRemaining,
//     this.countDownTimerStyle,
//     this.whenTimeExpires,
//     //this.countDownFormatter,
//   })  : secondsRemaining = secondsRemaining,
//         super(key: key);

//   final int secondsRemaining;
//   final Function whenTimeExpires;
//   //final Function countDownFormatter;
//   final TextStyle countDownTimerStyle;

//   State createState() => _CountDownTimerState();
// }

// class _CountDownTimerState extends State<CountDownTimer>
//     with TickerProviderStateMixin {
//   AnimationController _controller;
//   Duration duration;
//   AudioPlayer player;
//   static AudioCache cache = AudioCache();

//   // AnimationController _playerController;
//   // Duration playerDuration;
//   bool hasReachMiddle = false;

//   playTickTock() async {
//     print("player = await cache.play('audio/ticktock.mp3')");
//     //player = await cache.play('audio/ticktock.mp3');
//   }

//   stopTickTock() async {
//     print("cache stop playerrrrrrr");
//     // await player.stop();
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       duration = Duration(seconds: widget.secondsRemaining);
//       _controller = AnimationController(
//         vsync: this,
//         duration: duration,
//       );
//       _controller.reverse(from: widget.secondsRemaining.toDouble());
//       _controller.addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           stopTickTock();
//           widget.whenTimeExpires();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//         child: AnimatedBuilder(
//             animation: _controller,
//             builder: (_, Widget child) {
//               print(_controller.value);
//               if (_controller.value <= 0.5 && !hasReachMiddle) {
//                 playTickTock();
//                 hasReachMiddle = true;
//               }
//               return Text(
//                 timerDisplayString,
//                 style: widget.countDownTimerStyle,
//               );
//             }));
//   }

//   String formatHHMMSS(int seconds) {
//     int hours = (seconds / 3600).truncate();
//     seconds = (seconds % 3600).truncate();
//     int minutes = (seconds / 60).truncate();

//     String hoursStr = (hours).toString().padLeft(2, '0');
//     String minutesStr = (minutes).toString().padLeft(2, '0');
//     String secondsStr = (seconds % 60).toString().padLeft(2, '0');

//     if (hours == 0) {
//       return "$minutesStr:$secondsStr";
//     }

//     return "$hoursStr:$minutesStr:$secondsStr";
//   }

//   String get timerDisplayString {
//     Duration duration = _controller.duration * _controller.value;
//     // return widget.countDownFormatter != null
//     //     ? widget.countDownFormatter(duration.inSeconds)
//     //     : formatHHMMSS(duration.inSeconds);
//     return formatHHMMSS(duration.inSeconds);
//   }
// }
