import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final int n;
  const ShowText(this.n, {Key key}) : super(key: key);

  String _fillTime(int x) {
    if (x < 10) {
      return "0" + x.toString();
    }

    return x.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _fillTime(n),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 60,
      ),
    );
  }
}
