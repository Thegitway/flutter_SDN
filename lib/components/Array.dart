import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/constants.dart';

class Array extends StatelessWidget {
  double width;
  var col = <List<Widget>>[];

  Array({
    Key key,
    this.width,
    this.col,
  }) : super(key: key);

  List<Widget> setTheArray() {
    var widgets = <Widget>[];
    for (int i = 0; i < col.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: setCol(i),
      ));
    }

    return widgets;
  }

  List<Widget> setCol(int index) {
    var widgets = <Widget>[];
    for (int i = 0; i < col[index].length; i++) {
      widgets.add(Padding(
        padding: EdgeInsets.all(1),
        child: Container(
          width: (width / col[index].length) - 4 * col[index].length,
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: i == 0 ? Colors.grey[400] : Colors.green[400],
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Center(
            child: col[index][i],
          ),
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: setTheArray(),
    );
  }
}
