import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/body.dart';
import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';
import 'package:le_savoir_du_nord/components/RowButton.dart';
import 'package:le_savoir_du_nord/components/Master.dart';

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
  var ww;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fontSizes = MediaQuery.of(context).devicePixelRatio * 5;
    Size size = MediaQuery.of(context).size;
    ww = size.width / 6;
    return FutureBuilder(
        future: getApiAbsence(urlAbsence + '${studentID}/${registerID}'),
        builder: (context, snapshot) {
          absenceBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            if (Absence.maxPage != -1) {
              Body.titre = "";
              RowButton.iam = 2;
              List<String> namess = <String>[];
              absenceBody.values[Absence.actuelPage][6] == "null"
                  ? absenceBody.values[Absence.actuelPage][6] = "vide"
                  : absenceBody.values[Absence.actuelPage][6];
              for (int i = 0; i < Absence.maxPage; i++)
                namess
                    .add((i + 1).toString() + ") " + absenceBody.values[i][6]);
              return Master(
                body: Scaffold(
                  appBar: AppBar(
                      leading: Container(
                        child: Center(
                            child: Text(
                          "Absence",
                          style: TextStyle(color: kPrimaryLightColor),
                        )),
                        color: Colors.black38,
                      ),
                      leadingWidth: ww,
                      flexibleSpace: Padding(
                        padding: EdgeInsets.fromLTRB(ww, 0, 0, 0),
                        child: RowButton(
                          names: namess,
                          numOfButton: namess.length,
                        ),
                      )),
                  body: Array(width: size.width, col: [
                    [
                      Text("Langage", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          absenceBody.values[Absence.actuelPage][6] == "null"
                              ? "vide"
                              : absenceBody.values[Absence.actuelPage][6]
                                  .toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("""Heure d'abcense""",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          absenceBody.values[Absence.actuelPage][8] is String
                              ? absenceBody.values[Absence.actuelPage][8]
                              : absenceBody.values[Absence.actuelPage][8]
                                  .toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                  ]),
                ),
              );
            } else {
              Body.titre = "Information incorrecte";

              return Body();
            }
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
