import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';
import './main.dart';

class Quiz extends StatelessWidget {
  //const Quiz({Key? key}) : super(key: key);

  final Function nextQues;
  final List<Map<String,Object>> questions;
  final int index;

  Quiz(this.nextQues,this.questions,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
            shape: BoxShape.rectangle, color: Colors.amberAccent)),
        margin: EdgeInsets.all(0),
        child: Center(
            child: Column(
              /* For a row, the main axis runs horizontally and the cross axis runs vertically.
              For a column, the main axis runs vertically and the cross axis runs horizontally. */
              mainAxisAlignment: MainAxisAlignment.center,
              // to center the widgets vertically in column -> mainAxisAlignment: MainAxisAlignment.center
              // ITEMS ABOVE/BELOW EACH OTHER -> USE COLUMN() , ITEMS NEXT TO EACH OTHER -> USE ROW()
              children: /*<Widget> no need to specify widget explicitly as dart has type inference */
              [
                // CHILDREN TAKES LIST OF WIDGETS AS ARGUEMENTS
                Question(questions[index]["questiontext"] as String),
                ...(questions[index]["answertext"] as List<Map<String,Object>>)
                    .map((answer) {
                  return Answers(()=>nextQues(answer["score"]), answer["text"] as String);
                }).toList(),
                // Answers(nextQues),
                // Answers(nextQues),
                // Answers(nextQues),
                Text("Question : ${index + 1} "),
              ],
            )
        )
    );
}
}
