import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowText extends StatelessWidget {
  final int text;
  const ShowText(this.text, {Key key})
      : assert(text != null),
        super(key: key);

  List<String> _fillTime(int x) {
    var res = List<String>();

    if (x < 10) {
      res.add("0");
      res.add(x.toString());
    } else {
      res.add((x ~/ 10).toString());
      res.add((x % 10).toString());
    }

    return res;
  }

  Widget _svgNumber(
    String n, {
    @required double width,
    Color color,
  }) {
    return SvgPicture.asset(
      "assets/$n.svg",
      color: color,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final svgWidth = width / 8;

    var strTime = _fillTime(text);
    Color color = Colors.white;

    return Row(
      children: <Widget>[
        _svgNumber(strTime[0], width: svgWidth, color: color),
        _svgNumber(strTime[1], width: svgWidth, color: color),
      ],
    );
  }
}
