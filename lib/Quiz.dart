import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quizz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final Function answerQuestion;
  final int questionIndex;

  Quizz(@required this.question, @required this.answerQuestion,
      @required this.questionIndex);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(question[questionIndex]['question']
          .toString()), // Here when the input value in the stateless widget changes,because build methid in the main ran again then
      //flutter rebuild that widget.In case of statefull it is rerendered.So the stateless widget rebuild not because of internal state but because of input data.
      // here ... is used because here we are creating nesteed list,list under childeren ,therefore ... inject items of the list to the outer list making it unnested lists
      ...(question[questionIndex]['answer'] as List<Map<String, Object>>)
          .map((e) {
        //here it is mapping each value in answer list to the function through anonymus functions.
        return Answer(() => answerQuestion(e['score']), e['text'].toString());
      })
    ]);
  }
}
