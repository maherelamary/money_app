import 'package:flutter/material.dart';
import 'package:money_app/utils/color_palettes.dart';

class AnimatedButton extends StatefulWidget {
  String title;
  bool isLoading;
  Function onComplete;
  AnimatedButton({
    Key key,
    this.title,
    this.isLoading = false,
    this.onComplete,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _containerWidth;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _containerWidth =
        Tween<double>(begin: 250.0, end: 50.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return InkWell(
          onTap: () {
            //TODO
            if (widget?.isLoading == false) {
              _controller.forward();
            }
          },
          child: Container(
            height: 50.0,
            width: widget?.isLoading ? _containerWidth.value : 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorPalettes.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget?.isLoading ? 30 : 50),
              ),
            ),
            child: !widget?.isLoading
                ? Text(
                    widget.title,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )
                : Container(
                    height: 40.0,
                    width: 40.0,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 2.0,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
