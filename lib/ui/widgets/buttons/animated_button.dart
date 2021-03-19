import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class AnimatedButton extends StatefulWidget {
  String title;
  bool clicked;
  bool serverLoader;
  Function onComplete;
  AnimatedButton({
    Key key,
    this.title,
    this.clicked,
    this.serverLoader,
    this.onComplete,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _containerWidth;
  bool didFinishAnimate = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    _containerWidth =
        Tween<double>(begin: 250.0, end: 50.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
        didFinishAnimate = true;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clicked) {
      print("Forward");
      _controller.forward();
    }
    if (!widget.serverLoader && didFinishAnimate) {
      print("reverse");
      _controller.reverse();
      setState(() {
        didFinishAnimate = false;
      });
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          height: 50.0,
          width: _containerWidth.value,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorPalettes.secondaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: widget.serverLoader
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 2.0,
                  ),
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 18.0, fontFamily: 'Cairo', color: Colors.white),
                ),
        );
      },
    );
  }
}
