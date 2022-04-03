import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  @override
  final Function reset;
  final int score;
  Result(this.score, this.reset);
  String get resultPhrase {
    var ans = "x";
    if (score > 60) ans = 'Well Done';

    return ans;
  }

  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        children: [
          Center(
              child: Text(resultPhrase,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold))),
          FlatButton(onPressed: () => reset, child: Text('Restart Quizzz'))
        ],
      ),
      Center(
          child: Text(
        score.toString(),
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      )),
      RaisedButton(child: Text("Reset"), onPressed: () => reset),
    ]);
  }
}
