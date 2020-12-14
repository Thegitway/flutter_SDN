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
                Text("Class ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][0] == null
                        ? "none"
                        : absenceBody.values[Absence.actuelPage][0].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Student ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][1] is String
                        ? absenceBody.values[Absence.actuelPage][1]
                        : absenceBody.values[Absence.actuelPage][1].toString(),
                    style: TextStyle(fontSize: fontSizes))
              ],
              [
                Text("Class name", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][2] is String
                        ? absenceBody.values[Absence.actuelPage][2]
                        : absenceBody.values[Absence.actuelPage][2].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class link", style: TextStyle(fontSize: fontSizes)),
                ListTile(
                  title: Icon(
                    Icons.link,
                    size: fontSizes * 2.5,
                  ),
                  onTap: () async {
                    if (absenceBody.values[Absence.actuelPage][3] != null) {
                      if (await canLaunch(
                          absenceBody.values[Absence.actuelPage][3]))
                        launch(absenceBody.values[Absence.actuelPage][3]);
                    }
                  },
                ),
              ],
              [
                Text("Student last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][4] is String
                        ? absenceBody.values[Absence.actuelPage][4]
                        : absenceBody.values[Absence.actuelPage][4].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("term", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][5] is String
                        ? absenceBody.values[Absence.actuelPage][5]
                        : absenceBody.values[Absence.actuelPage][5].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Langage", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][6] is String
                        ? absenceBody.values[Absence.actuelPage][6]
                        : absenceBody.values[Absence.actuelPage][6].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Level", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.values[Absence.actuelPage][7] is String
                        ? absenceBody.values[Absence.actuelPage][7]
                        : absenceBody.values[Absence.actuelPage][7].toString(),
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
