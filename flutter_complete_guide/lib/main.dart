import 'package:flutter/material.dart';

import './question.dart';
import 'answer.dart';

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
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter Guide App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Question(
            questions.elementAt(_questionIndex),
          ),
          Answer('Answer 1', _answerQuestion),
          Answer('Answer 2', _answerQuestion),
          Answer('Answer 3', _answerQuestion)
        ],
      ),
    ));
  }
}
