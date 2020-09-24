import 'package:flutter/material.dart';
import 'package:flutter_demo/localization/localization_constants.dart';

class GameOverWidget extends StatelessWidget {
  final int _currentScore;
  final int _questionsSize;
  final Function playAgain;
  Icon _icon = Icon(Icons.error);
  String _resulteMsg = '';

  GameOverWidget(this._currentScore, this._questionsSize, this.playAgain,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    getMsg(context);
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            _icon,
            Text(
              '${getTranslated(context, 'goPage_Title')}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${_resulteMsg} ($_currentScore/${_questionsSize})',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: playAgain,
              child: Text('${getTranslated(context, 'goPage_play_again')}'),
            )
          ],
        ),
      ),
    );
  }

  void getMsg(BuildContext context) {
    switch (_currentScore) {
      case 0:
        {
          _icon = Icon(
            Icons.cancel,
            color: Colors.red,
            size: 70,
          );
          _resulteMsg = '${getTranslated(context, 'goPage_error_msg')}';
          break;
        }

      case 1:
        {
          _icon = Icon(
            Icons.cancel,
            color: Colors.red,
            size: 70,
          );
          _resulteMsg = '${getTranslated(context, 'goPage_most_error_msg')}';
          break;
        }
      case 2:
        {
          _icon = Icon(
            Icons.error,
            color: Colors.yellow,
            size: 70,
          );
          _resulteMsg = '${getTranslated(context, 'goPage_most_error_msg')}';
          break;
        }
      case 3:
        {
          _icon = Icon(
            Icons.error,
            color: Colors.yellow,
            size: 70,
          );
          _resulteMsg = '${getTranslated(context, 'goPage_some_error_msg')}';
          break;
        }
      case 4:
      case 5: // Enter this block if _currentScore == 4 or _currentScore == 5
        {
          _icon = Icon(
            Icons.check_circle,
            color: Colors.yellow,
            size: 70,
          );
          _resulteMsg = '${getTranslated(context, 'goPage_some_success_msg')}';
          break;
        }
      case 6:
        {
          _icon = Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 70,
          );
          _resulteMsg = '${getTranslated(context, 'goPage_success_msg')}';
          break;
        }
    }
  }
}
