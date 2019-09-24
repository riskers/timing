import 'package:flutter/material.dart';

import 'src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timing',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: App(),
        ),
      ),
    );
  }
}
