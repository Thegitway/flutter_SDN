import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:le_savoir_du_nord/components/Note.dart';
import 'package:le_savoir_du_nord/Screens/note/note_screen.dart';
import 'package:le_savoir_du_nord/Screens/class/class_screen.dart';
import 'package:le_savoir_du_nord/Screens/absence/absence.screen.dart';

import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/components/Class.dart';

class RowButton extends StatefulWidget {
  int numOfButton;
  List<String> names;
  static int iam = 0;
  RowButton({Key key, this.numOfButton, this.names}) : super(key: key);

  @override
  _RowButtonState createState() => _RowButtonState();
}

class _RowButtonState extends State<RowButton> {
  List<Widget> setTheRowNote() {
    var widgets = <Widget>[];
    for (int i = 0; i < widget.numOfButton; i++) {
      widgets.add(FlatButton(
          onPressed: () {
            if (Note.actuelPage != i)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    Note.actuelPage = i;
                    return NoteScreen();
                  },
                ),
              );
          },
          child: Text(widget.names[i])));
    }

    return widgets;
  }

  List<Widget> setTheRowClass() {
    var widgets = <Widget>[];
    for (int i = 0; i < widget.numOfButton; i++) {
      widgets.add(FlatButton(
          onPressed: () {
            if (Class.actuelPage != i)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    Class.actuelPage = i;
                    return ClassScreen();
                  },
                ),
              );
          },
          child: Text(widget.names[i])));
    }

    return widgets;
  }

  List<Widget> setTheRowAbsence() {
    var widgets = <Widget>[];
    for (int i = 0; i < widget.numOfButton; i++) {
      widgets.add(FlatButton(
          onPressed: () {
            if (Absence.actuelPage != i)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    Absence.actuelPage = i;
                    return AbsenceScreen();
                  },
                ),
              );
          },
          child: Text(widget.names[i])));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    if (RowButton.iam == 0)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: setTheRowNote(),
      );
    else if (RowButton.iam == 1)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: setTheRowClass(),
      );
    if (RowButton.iam == 2)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: setTheRowAbsence(),
      );
  }
}
