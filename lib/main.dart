import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
    final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers'     : [{'text': 'Black', 'score': 10},
                         {'text': 'Red', 'score': 5},
                         {'text': 'Green', 'score': 5},
                         {'text': 'White', 'score': 1}],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers'     : [{'text': 'Rabbit', 'score': 10},
                         {'text': 'Snake', 'score': 10},
                         {'text': 'Elephant', 'score': 10},
                         {'text': 'Lion', 'score': 10}],
      },
      {
        'questionText': 'WHo\'s your favorite instructor?',
        'answers'     : [{'text': 'Muhlis', 'score': 10},
                         {'text': 'Ucup', 'score': 4},
                         {'text': 'Donal', 'score': 5},
                         {'text': 'Bebek', 'score': 6}],
      },
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){

    _totalScore += score;

    setState((){
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
      if(_questionIndex < _questions.length){
        print('We Have more questions!');
      }else{
        print('No more questions!');
      }
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length 
        ? Quiz(
          answerQuestions: _answerQuestion, 
          questionIndex: _questionIndex, 
          questions:_questions
        )
        : Result(_totalScore, _resetQuiz),
      )
    );
  }
}