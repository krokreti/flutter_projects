import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer 1');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter Guide App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: answerQuestion,
            child: Text('Question 1'),
          ),
          ElevatedButton(
            onPressed: answerQuestion,
            child: Text('Question 2'),
          ),
          ElevatedButton(
            onPressed: answerQuestion,
            child: Text('Question 3'),
          )
        ],
      ),
    ));
  }
}
