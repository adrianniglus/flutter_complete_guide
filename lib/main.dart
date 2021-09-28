import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What is your favourite color?',
        'answers': ['Red', 'Blue', 'White', 'Black']
      },
      {
        'questionText': 'What is your favourite animal?',
        'answers': ['Dog', 'Cat', 'Horse', 'Cow']
      },
      {
        'questionText': 'What is your favourite drink?',
        'answers': ['Vodka', 'Beer', 'Water', 'Juice']
      },
      {
        'questionText': 'What is your favourite dish?',
        'answers': ['Burger', 'Kebab', 'Casserole', 'Taco']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answer, _answerQuestion);
            }).toList()
          ],
        ),
      ),
    );
  }
}
