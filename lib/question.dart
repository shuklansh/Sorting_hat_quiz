import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: Text(
          questionText,
          style:
              TextStyle(color: Color.fromRGBO(121, 0, 81, 1.0), fontSize: 20),
          textAlign: TextAlign.center,
        ));
  }
}
