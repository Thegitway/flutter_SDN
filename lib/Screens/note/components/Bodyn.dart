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
    fontSizes = MediaQuery.of(context).devicePixelRatio * 5;

    return FutureBuilder(
        future: getApiNote(urlNote + '${studentID}/${registerID}'),
        builder: (context, snapshot) {
          noteBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Array(width: size.width, col: [
              [
                Text("Student last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][10] is String
                        ? noteBody.values[Note.actuelPage][10]
                        : noteBody.values[Note.actuelPage][10].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Student first name",
                    style: TextStyle(fontSize: fontSizes)),
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
                Text("Participation", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][3] is String
                        ? noteBody.values[Note.actuelPage][3]
                        : noteBody.values[Note.actuelPage][3].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Final exam", style: TextStyle(fontSize: fontSizes)),
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
                Text("decision", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][6] is String
                        ? noteBody.values[Note.actuelPage][6]
                        : noteBody.values[Note.actuelPage][6].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Teacher remarks", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][7] is String
                        ? noteBody.values[Note.actuelPage][7]
                        : noteBody.values[Note.actuelPage][7].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class name", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][8] is String
                        ? noteBody.values[Note.actuelPage][8]
                        : noteBody.values[Note.actuelPage][8].toString(),
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
                    if (noteBody.values[Note.actuelPage][9] != null) {
                      if (await canLaunch(noteBody.values[Note.actuelPage][9]))
                        launch(noteBody.values[Note.actuelPage][9]);
                    }
                  },
                ),
              ],
              [
                Text("Teacher last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][11] is String
                        ? noteBody.values[Note.actuelPage][11]
                        : noteBody.values[Note.actuelPage][11].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Teacher first name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][12] is String
                        ? noteBody.values[Note.actuelPage][12]
                        : noteBody.values[Note.actuelPage][12].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class term", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][13] is String
                        ? noteBody.values[Note.actuelPage][13]
                        : noteBody.values[Note.actuelPage][13].toString(),
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
                Text("Level", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][15] is String
                        ? noteBody.values[Note.actuelPage][15]
                        : noteBody.values[Note.actuelPage][15].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Category", style: TextStyle(fontSize: fontSizes)),
                Text(
                    noteBody.values[Note.actuelPage][15] is String
                        ? noteBody.values[Note.actuelPage][15]
                        : noteBody.values[Note.actuelPage][15].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
            ]);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
