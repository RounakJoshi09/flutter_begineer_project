import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
// From this class we have to call the function which is changing the state of widget ,which is calling this class,
//for this we will use a pointer function and initializes it with the help of constructor;
  final Function selectAnswer;
  final String answers;
  Answer(this.selectAnswer, this.answers);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answers),
        color: Colors.blue,
        onPressed: () => selectAnswer(),
      ),
    );
  }
}
