import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import 'Quiz.dart';
import 'result.dart';

void main() {
  runApp(
      MyApp()); //This is used to run particular widget,which takes instance of that widget.
}

//Since it is a stateless widget ,it cant be re-rendered,it could only be rebuild.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // This is actually creating a state
    return MyAppState(); // '_' in front of any  property or method signifies that it is now private and can be used withi
    //this file only ,if this file is imported somewhere else,then this function or property is not yet included.
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;
  //This is a Map used to store key value Pair
  var question = [
    //This is actually list of maps.
    {
      //Key                 //Value
      'question': 'What\'s your Favourite Colour?',
      'answer': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Violet', 'score': 4}
      ],
    },
    {
      'question': 'What\'s your Favourite Animal?',
      'answer': [
        {'text': 'Horse', 'score': 2},
        {'text': 'Lion', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Eagle', 'score': 4}
      ]
    }
  ];
  void reset() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    setState(() {
      totalScore += score;
      //Here it is setting a state with new variable.i.e It is justr calling Widget build again of the widget of which it called,and rendering all the information.However
      //Flutter internal mechanism only renders what is changed in the widget not the whole widget.
      questionIndex = (questionIndex + 1);
    });

    print('Question Answered!');
  }

  @override //It is used to just specify that we are overriding an already existing function deliberately.MyApp
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            // Scaffold is used to create a basic page of APP
            appBar: AppBar(
              title: Text('My App'),
              shadowColor: Color.fromARGB(0, 17, 78,
                  245), // Here AppBar is a widget which takes title as aText widget.
            ),
            body: questionIndex < question.length
                ? Quizz(question, answerQuestion, questionIndex)
                : Result(totalScore, reset)));
  }
}
