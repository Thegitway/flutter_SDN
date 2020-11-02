import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/constants.dart';

class Array extends StatelessWidget {
  int row = 2, column = 2;
  var col1 = <String>["Class", "Test1"];
  var col2 = <String>["English", "5/20"];

  List<Widget> setTheArray() {
    var widgets = <Widget>[];
    for (int i = 0; i < row; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                col1[i],
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text(
                col2[i],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ));
    }

    return widgets;
  }

  Array({Key key, this.row, this.column}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: setTheArray(),
    );
  }
}
