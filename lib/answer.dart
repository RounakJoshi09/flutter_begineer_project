import 'package:flutter/material.dart';

class answer extends StatelessWidget {
// From this class we have to call the function which is changing the state of widget ,which is calling this class,
//for this we will use a pointer function and initializes it with the help of constructor;
final Function selectAnswer;

answer( this.selectAnswer);
 
  @override
  Widget build(BuildContext context) {
    return Container(
        width:double.infinity,
        child: RaisedButton(
          child: Text('Answer 1'),
          color: Colors.blue,
          onPressed: ()=>selectAnswer(),
          ),

    );
  }
}