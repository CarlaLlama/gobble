import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(TimerWidget());

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}


class _TimerWidgetState extends State<TimerWidget> with TickerProviderStateMixin {

  AnimationController _controller;
  static const int _timeLeft = 180; // Seconds

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _timeLeft),
    );

    _controller.forward(from: 0.0);
  }

  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Countdown(
          animation: new StepTween(
            begin: _timeLeft,
            end: 0
          ).animate(_controller)
        )
      )
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class Countdown extends AnimatedWidget {
  Countdown({ Key key, this.animation }) : super(key: key, listenable: animation);
  Animation<int> animation;

  String timerString(){
    int duration = animation.value;
    return '${duration % 60}:${((duration % 60) % 1).toString().padLeft(2, '0')}';
  }

  @override
  build(BuildContext context){
    return new Text(
      //animation.value.toString(),
      timerString(),
      style: new TextStyle(fontSize: 18.0),
    );
  }
}
//class TimerPainter extends CustomPainter {
//  TimerPainter({
//    this.animation,
//    this.backgroundColour,
//    this.colour,
//}) : super(repaint: animation);
//
//  final Animation<double> animation;
//  final Color backgroundColor, color;
//}