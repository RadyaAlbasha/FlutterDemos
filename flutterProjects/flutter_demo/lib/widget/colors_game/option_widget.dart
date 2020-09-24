import 'package:flutter/material.dart';
import 'package:flutter_demo/model/colors_game/option.dart';

class OptionWidget extends StatelessWidget {
  final Option option;
  Function(bool) onClick;
  OptionWidget(this.option, this.onClick, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        onClick(option.isCorrectAnswer);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Text(
          option.text,
          style: TextStyle(fontSize: 20),
        ),
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
