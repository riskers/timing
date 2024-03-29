import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeRight,
    ]);

    now = DateTime.now();
    startTimer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
    stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
