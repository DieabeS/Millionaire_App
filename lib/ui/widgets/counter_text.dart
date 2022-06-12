import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterText extends StatefulWidget {
  int? duration;
  final Function? setNewDuration;

  CounterText({this.duration, this.setNewDuration});

  @override
  _CounterTextState createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  late Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (widget.duration! < 1) {
          } else {
            widget.duration = widget.duration! - 1;
            widget.setNewDuration!(widget.duration);
          }
        },
      ),
    );
  }

  void resetTimer() {
    _timer.cancel();
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.duration! > 0 ? '00:${widget.duration.toString()}' : "",
        style: TextStyle(fontSize: 20, color: Colors.black));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
