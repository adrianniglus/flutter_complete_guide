import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function _resetQuiz;

  Result(this._totalScore, this._resetQuiz);

  String get resultPhrase {
    String text;
    if (_totalScore > 27)
      text = 'Jesteś zajebisty! Twój wynik to: ${_totalScore}';
    else if (12 < _totalScore && _totalScore <= 27)
      text = 'Jesteś trochę nudny, twój wynik to: ${_totalScore}';
    else {
      text = 'Jesteś super nudny, twój wynik to: ${_totalScore}';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text('Try again!'),
            onPressed: _resetQuiz,
          )
        ],
      ),
    );
  }
}
