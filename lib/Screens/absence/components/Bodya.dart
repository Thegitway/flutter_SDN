import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';

class Bodya extends StatefulWidget {
  const Bodya({
    Key key,
  }) : super(key: key);
  @override
  _BodyaState createState() => _BodyaState();
}

class _BodyaState extends State<Bodya> {
  double fontSizes;
  Absence absenceBody;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fontSizes = MediaQuery.of(context).devicePixelRatio * 5;
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getApiAbsence(urlAbsence + '${studentID}/${registerID}'),
        builder: (context, snapshot) {
          absenceBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Array(width: size.width, col: [
              [
                Text("Langage", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][6] is String
                        ? absenceBody.values[Absence.actuelPage][6]
                        : absenceBody.values[Absence.actuelPage][6].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("""Heure d'abcense""",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][8] is String
                        ? absenceBody.values[Absence.actuelPage][8]
                        : absenceBody.values[Absence.actuelPage][8].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
            ]);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
