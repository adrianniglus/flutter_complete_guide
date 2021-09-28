import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function _answerQuestion;
  final List<Map<String, Object>> _questions;
  final int _questionIndex;

  Quiz(this._answerQuestion, 
       this._questions,
       this._questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(_questions[_questionIndex]['questionText']),
        ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'], () => _answerQuestion(answer['score']));
        }).toList()
      ],
    );
  }
}
