import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeing/src/show_text.dart';

class Timing extends StatefulWidget {
  Timing({Key key}) : super(key: key);

  _TimingState createState() => _TimingState();
}

class _TimingState extends State<Timing> {
  DateTime now;
  Timer timer;

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ShowText(now.hour),
            ShowText(now.minute),
            ShowText(now.second),
          ],
        ),
      ),
    );
  }
}
