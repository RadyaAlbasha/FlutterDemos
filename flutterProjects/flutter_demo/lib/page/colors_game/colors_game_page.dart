import 'package:flutter/material.dart';
import 'package:flutter_demo/localization/localization_constants.dart';
import 'package:flutter_demo/model/colors_game/option.dart';
import 'package:flutter_demo/model/colors_game/question.dart';
import 'package:flutter_demo/widget/colors_game/change_language_button_widget.dart';
import 'package:flutter_demo/widget/colors_game/game_over_widget.dart';
import 'package:flutter_demo/widget/colors_game/option_widget.dart';
import 'package:flutter_demo/widget/colors_game/question_text_widget.dart';

class ColorsGamePage extends StatefulWidget {
  final String title;

  ColorsGamePage(this.title, {Key key}) : super(key: key);

  @override
  _ColorsGamePageState createState() => _ColorsGamePageState();
}

class _ColorsGamePageState extends State<ColorsGamePage> {
  int _currentQuestion = 0;
  int _currentScore = 0;
  List<Question> _questions;

  List<Widget> options;

  _onOptionClicked(bool isCorrectAnswer) {
    if (isCorrectAnswer) {
      _currentScore++;
    }
    setState(() {
      _currentQuestion++;
    });
  }

  _playAgain() {
    setState(() {
      _questions.shuffle(); // change list order (random)
      _currentQuestion = 0;
      _currentScore = 0;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Question question1 =
        Question(getTranslated(context, 'green'), Colors.black, [
      Option(getTranslated(context, 'green')),
      Option(getTranslated(context, 'red')),
      Option(getTranslated(context, 'blue')),
      Option(getTranslated(context, 'orange')),
      Option(getTranslated(context, 'yellow')),
      Option(getTranslated(context, 'black'), true)
    ]);
    Question question2 =
        Question(getTranslated(context, 'red'), Colors.yellow, [
      Option(getTranslated(context, 'red')),
      Option(getTranslated(context, 'blue')),
      Option(getTranslated(context, 'green')),
      Option(getTranslated(context, 'orange')),
      Option(getTranslated(context, 'yellow'), true),
      Option(getTranslated(context, 'black'))
    ]);
    Question question3 =
        Question(getTranslated(context, 'blue'), Colors.orange, [
      Option(getTranslated(context, 'red')),
      Option(getTranslated(context, 'blue')),
      Option(getTranslated(context, 'green')),
      Option(getTranslated(context, 'orange'), true),
      Option(getTranslated(context, 'yellow')),
      Option(getTranslated(context, 'black'))
    ]);
    Question question4 =
        Question(getTranslated(context, 'orange'), Colors.blue, [
      Option(getTranslated(context, 'red')),
      Option(getTranslated(context, 'blue'), true),
      Option(getTranslated(context, 'green')),
      Option(getTranslated(context, 'orange')),
      Option(getTranslated(context, 'yellow')),
      Option(getTranslated(context, 'black'))
    ]);
    Question question5 =
        Question(getTranslated(context, 'yellow'), Colors.red, [
      Option(getTranslated(context, 'red'), true),
      Option(getTranslated(context, 'blue')),
      Option(getTranslated(context, 'green')),
      Option(getTranslated(context, 'orange')),
      Option(getTranslated(context, 'yellow')),
      Option(getTranslated(context, 'black'))
    ]);
    Question question6 =
        Question(getTranslated(context, 'black'), Colors.green, [
      Option(getTranslated(context, 'red')),
      Option(getTranslated(context, 'blue')),
      Option(getTranslated(context, 'green'), true),
      Option(getTranslated(context, 'orange')),
      Option(getTranslated(context, 'yellow')),
      Option(getTranslated(context, 'black'))
    ]);
    _questions = [
      question1,
      question2,
      question3,
      question4,
      question5,
      question6
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestion < _questions.length) {
      options = _questions[_currentQuestion].options.map((option) {
        return OptionWidget(option, _onOptionClicked);
      }).toList();
      options.shuffle(); // change list order (random)
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ChangeLanguageButtonWidget(context),
        ],
      ),
      body: (_currentQuestion < _questions.length)
          ? Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    getTranslated(context, 'cgQ_Title'),
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuestionText(_questions[_currentQuestion].title,
                      _questions[_currentQuestion].color),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: options,
                    ),
                  )
                ],
              ),
            )
          : GameOverWidget(_currentScore, _questions.length, _playAgain),
    );
  }
}
