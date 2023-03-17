import 'package:flutter/material.dart';

class ModelButton extends StatelessWidget {
  final String title;
  final Function handleClick;

  const ModelButton(
      {super.key, required this.title, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            handleClick();
          },
          child: Text(title),
        ),
      ),
    );
  }
}
