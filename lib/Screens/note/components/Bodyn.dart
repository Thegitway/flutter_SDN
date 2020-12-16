import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Note.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/body.dart';
import 'package:le_savoir_du_nord/components/RowButton.dart';
import 'package:le_savoir_du_nord/components/Master.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';

class Bodyn extends StatefulWidget {
  Bodyn({
    Key key,
  }) : super(key: key);

  @override
  _BodynState createState() => _BodynState();
}

class _BodynState extends State<Bodyn> {
  Note noteBody;

  void initState() {
    super.initState();
    Body.bot = true;
  }

  double fontSizes;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    fontSizes = MediaQuery.of(context).devicePixelRatio * 5;

    return FutureBuilder(
        future: getApiNote(urlNote + '${studentID}/${registerID}'),
        builder: (context, snapshot) {
          noteBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            if (Note.maxPage != -1) {
              Body.titre = "";
              RowButton.iam = 0;
              List<String> namess = <String>[];
              for (int i = 0; i < Note.maxPage; i++)
                namess.add((i + 1).toString() + ") " + noteBody.values[i][14]);
              return Scaffold(
                  appBar: AppBar(
                      leading: new Container(),
                      leadingWidth: 0,
                      centerTitle: true,
                      title: RowButton(
                        names: namess,
                        numOfButton: namess.length,
                      )),
                  body: Array(width: size.width, col: [
                    [
                      Text("Nom", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][10] is String
                              ? noteBody.values[Note.actuelPage][10]
                              : noteBody.values[Note.actuelPage][10].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Prenom", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][0] is String
                              ? noteBody.values[Note.actuelPage][0]
                              : noteBody.values[Note.actuelPage][0].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Test 1", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][1] is String
                              ? noteBody.values[Note.actuelPage][1]
                              : noteBody.values[Note.actuelPage][1].toString(),
                          style: TextStyle(fontSize: fontSizes))
                    ],
                    [
                      Text("Test 2", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][2] is String
                              ? noteBody.values[Note.actuelPage][2]
                              : noteBody.values[Note.actuelPage][2].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Participation",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][3] is String
                              ? noteBody.values[Note.actuelPage][3]
                              : noteBody.values[Note.actuelPage][3].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Exam finale",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][4] is String
                              ? noteBody.values[Note.actuelPage][4]
                              : noteBody.values[Note.actuelPage][4].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Total", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][5] is String
                              ? noteBody.values[Note.actuelPage][5]
                              : noteBody.values[Note.actuelPage][5].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Decision", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][6] is String
                              ? noteBody.values[Note.actuelPage][6]
                              : noteBody.values[Note.actuelPage][6].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Remarque du professeur",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][7] is String
                              ? noteBody.values[Note.actuelPage][7]
                              : noteBody.values[Note.actuelPage][7].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Nom de classe",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][8] is String
                              ? noteBody.values[Note.actuelPage][8]
                              : noteBody.values[Note.actuelPage][8].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Lien de classe",
                          style: TextStyle(fontSize: fontSizes)),
                      ListTile(
                        title: Icon(
                          Icons.link,
                          size: fontSizes * 2.5,
                        ),
                        onTap: () async {
                          if (noteBody.values[Note.actuelPage][9] != null) {
                            if (await canLaunch(
                                noteBody.values[Note.actuelPage][9]))
                              launch(noteBody.values[Note.actuelPage][9]);
                          }
                        },
                      ),
                    ],
                    [
                      Text("Professeur", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][11].toString() +
                              " " +
                              noteBody.values[Note.actuelPage][12].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Langage", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][14] is String
                              ? noteBody.values[Note.actuelPage][14]
                              : noteBody.values[Note.actuelPage][14].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Niveau", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][15] is String
                              ? noteBody.values[Note.actuelPage][15]
                              : noteBody.values[Note.actuelPage][15].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Categorie", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          noteBody.values[Note.actuelPage][16] is String
                              ? noteBody.values[Note.actuelPage][16]
                              : noteBody.values[Note.actuelPage][16].toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                  ]));
            } else {
              Body.titre = "Information incorrecte";
              Body.bot = false;

              return Body();
            }
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
