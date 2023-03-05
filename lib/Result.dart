import 'dart:ffi';

import 'package:flutter/material.dart';
import './main.dart';

class Result extends StatelessWidget {
  //const Result({Key? key}) : super(key: key);

  final int Resultscore;

  final VoidCallback restarter;

  Result(this.Resultscore,this.restarter);

  List outputPersonality(int resScore) {
    String personality = "";
    String color = "";
    if (resScore < 10) {
      personality = "Hufflepuff";
      color = "white";
    } else if (resScore > 25) {
      personality = "Slytherin";
      color = "red";
    } else {
      personality = "Gryffindor";
      color = "deepPurple";
    }
    return [personality, color];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
            shape: BoxShape.rectangle, color: Color.fromRGBO(37, 37, 37, 1))),
        child: (Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your are : ${outputPersonality(Resultscore)[0]}",
                  style: TextStyle(
                      color: Resultscore < 10
                          ? Colors.amberAccent
                          : Resultscore > 25
                              ? Colors.greenAccent
                              : Colors.redAccent,
                      fontSize: 36,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              ElevatedButton(onPressed: restarter,
                  child: Text("Restart Quiz"))
            ],
          ),
        )));
  }
}
