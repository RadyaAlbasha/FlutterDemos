import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String title;
  final Color textColor;

  QuestionText(this.title, this.textColor, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: textColor),
    );
  }
}
