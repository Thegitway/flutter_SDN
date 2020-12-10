import 'package:le_savoir_du_nord/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Note.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';

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
  }

  double fontSizes;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    fontSizes = size.width / 22;

    return FutureBuilder(
        future: getApiNote(urlNote + "4019167" + "/" + "1711820"),
        builder: (context, snapshot) {
          noteBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Array(width: size.width, col: [
              [
                Text("Student last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][10] is String
                        ? noteBody.values[0][10]
                        : noteBody.values[0][10].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Student first name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][0] is String
                        ? noteBody.values[0][0]
                        : noteBody.values[0][0].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Test 1", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][1] is String
                        ? noteBody.values[0][1]
                        : noteBody.values[0][1].toString(),
                    style: TextStyle(fontSize: fontSizes))
              ],
              [
                Text("Test 2", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][2] is String
                        ? noteBody.values[0][2]
                        : noteBody.values[0][2].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Participation", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][3] is String
                        ? noteBody.values[0][3]
                        : noteBody.values[0][3].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Final exam", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][4] is String
                        ? noteBody.values[0][4]
                        : noteBody.values[0][4].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Total", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][5] is String
                        ? noteBody.values[0][5]
                        : noteBody.values[0][5].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("decision", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][6] is String
                        ? noteBody.values[0][6]
                        : noteBody.values[0][6].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Teacher remarks", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][7] is String
                        ? noteBody.values[0][7]
                        : noteBody.values[0][7].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class name", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][8] is String
                        ? noteBody.values[0][8]
                        : noteBody.values[0][8].toString(),
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
                    if (noteBody.values[0][9] != null) {
                      if (await canLaunch(noteBody.values[0][9]))
                        launch(noteBody.values[0][9]);
                    }
                  },
                ),
              ],
              [
                Text("Teacher last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][11] is String
                        ? noteBody.values[0][11]
                        : noteBody.values[0][11].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Teacher first name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][12] is String
                        ? noteBody.values[0][12]
                        : noteBody.values[0][12].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class term", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][13] is String
                        ? noteBody.values[0][13]
                        : noteBody.values[0][13].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Langage", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][14] is String
                        ? noteBody.values[0][14]
                        : noteBody.values[0][14].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Level", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][15] is String
                        ? noteBody.values[0][15]
                        : noteBody.values[0][15].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Category", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[0][15] is String
                        ? noteBody.values[0][15]
                        : noteBody.values[0][15].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
            ]);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
