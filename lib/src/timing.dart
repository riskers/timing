import 'dart:async';

import 'package:flutter/material.dart';

class Timing extends StatefulWidget {
  Timing({Key key}) : super(key: key);

  _TimingState createState() => _TimingState();
}

class _TimingState extends State<Timing> {
  DateTime now;
  Timer timer;

  String fillTime(int x) {
    if (x < 10) {
      return "0" + x.toString();
    }

    return x.toString();
  }

  void startTimer() {
    const timeout = Duration(seconds: 1);
    timer = Timer.periodic(timeout, (_) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            fillTime(now.hour),
          ),
          Text(
            fillTime(now.minute),
          ),
          Text(
            fillTime(now.second),
          ),
        ],
      ),
    );
  }
}
