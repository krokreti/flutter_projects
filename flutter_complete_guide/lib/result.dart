import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restartHandler;

  Result({this.score, this.restartHandler});

  String get resultPhrase {
    String resultText;
    if (score <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (score <= 12) {
      resultText = 'Pretty likeable!';
    } else if (score <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Your total score is ${score}',
          style: TextStyle(
            fontSize: 36,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
            onPressed: restartHandler,
            child: Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ))
      ],
    ));
  }
}
