import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  //This is a Map used to store key value Pair
  var question = [
    //This is actually list of maps.
    {
      //Key                 //Value
      'question': 'What\'s your Favourite Colour?',
      'answer': ['Blue', 'Red', 'Green', 'Violet'],
    },
    {
      'question': 'What\'s your Favourite Animal?',
      'answer': ['ButterFly', 'Bull', 'Panda', 'Horse']
    }
  ];
  void answerQuestion() {
    setState(() {
      //Here it is setting a state with new variable.i.e It is justr calling Widget build again of the widget of which it called,and rendering all the information.However
      //Flutter internal mechanism only renders what is changed in the widget not the whole widget.
      questionIndex = (questionIndex + 1) % 2;
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
        body: Column(children: [
          Question(question[questionIndex]['question']
              .toString()), // Here when the input value in the stateless widget changes,because build methid in the main ran again then
          //flutter rebuild that widget.In case of statefull it is rerendered.So the stateless widget rebuild not because of internal state but because of input data.
          // here ... is used because here we are creating nesteed list,list under childeren ,therefore ... inject items of the list to the outer list making it unnested lists
          ...(question[questionIndex]['answer'] as List<String>).map((e) {
            //here it is mapping each value in answer list to the function through anonymus functions.
            return Answer(answerQuestion, e);
          }).toList()
        ]),
      ),
    );
  }
}
