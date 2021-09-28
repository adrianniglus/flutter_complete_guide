import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  static const _questions = [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 3},
        {'text': 'Blue', 'score': 5},
        {'text': 'White', 'score': 10},
        {'text': 'Black', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Horse', 'score': 3},
        {'text': 'Cow', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your favourite drink?',
      'answers': [
        {'text': 'Vodka', 'score': 10},
        {'text': 'Beer', 'score': 5},
        {'text': 'Water', 'score': 1},
        {'text': 'Juice', 'score': 3}
      ]
    },
    {
      'questionText': 'What is your favourite dish?',
      'answers': [
        {'text': 'Burger', 'score': 5},
        {'text': 'Kebab', 'score': 10},
        {'text': 'Casserole', 'score': 3},
        {'text': 'Taco', 'score': 1}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_answerQuestion, _questions, _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
