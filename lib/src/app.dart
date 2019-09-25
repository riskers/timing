import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeing/src/show_text.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 20,
            child: ShowText(now.hour),
          ),
          Positioned(
            top: 20,
            left: 100,
            child: ShowText(now.minute),
          ),
          Positioned(
            top: 20,
            left: 180,
            child: ShowText(now.second),
          ),
          // ShowText(now.second),
        ],
      ),
    );
  }
}
