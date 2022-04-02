import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()); //This is used to run particular widget,which takes instance of that widget.
}

class MyApp extends StatelessWidget {
  @override //It is used to just specify that we are overriding an already existing function deliberately.MyApp
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // Scaffold is used to create a basic page of APP
        appBar: AppBar(
        title: Text('My App'),
        shadowColor: Color.fromARGB(0, 17, 78, 245), // Here AppBar is a widget which takes title as aText widget.
        ),
        body: Text('Hello Rounak'),
      ),
      
    );
  }
}
