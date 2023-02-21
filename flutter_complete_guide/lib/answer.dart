import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;

  // final Function selectedHandler;
  final VoidCallback selectedHandler;

  Answer(this.answerText, this.selectedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectedHandler,
        child: Text(
          answerText,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
      ),
    );
  }
}
