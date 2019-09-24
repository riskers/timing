import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final int text;
  const ShowText(this.text, {Key key}) : super(key: key);

  String _fillTime(int x) {
    if (x < 10) {
      return "0" + x.toString();
    }

    return x.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _fillTime(text),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 60,
      ),
    );
  }
}
