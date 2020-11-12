import 'package:le_savoir_du_nord/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Class.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';

class Bodyc extends StatefulWidget {
  const Bodyc({
    Key key,
  }) : super(key: key);

  @override
  _BodycState createState() => _BodycState();
}

class _BodycState extends State<Bodyc> {
  double fontSizes;
  Class classBody;
  @override
  void initState() {
    super.initState();
    /* ClassApi().then((value) {
      setState(() {
        AbsenceBody = value;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    fontSizes = MediaQuery.of(context).devicePixelRatio * 8;
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getApiClass(urlClass + '${studentID}/${registerID}'),
        builder: (context, snapshot) {
          classBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Array(width: size.width, col: [
              [
                Text("Class ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[0] is String
                        ? classBody.values[0]
                        : classBody.values[0].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Student ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[1] is String
                        ? classBody.values[1]
                        : classBody.values[1].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class name", style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[2] is String
                        ? classBody.values[2]
                        : classBody.values[2].toString(),
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
                    if (classBody.values[3] != null) {
                      if (await canLaunch(classBody.values[3]))
                        launch(classBody.values[3]);
                    }
                  },
                ),
              ],
              [
                Text("Student last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[4] is String
                        ? classBody.values[4]
                        : classBody.values[4].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class term", style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[5] is String
                        ? classBody.values[5]
                        : classBody.values[5].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Langage", style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[6] is String
                        ? classBody.values[6]
                        : classBody.values[6].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Level", style: TextStyle(fontSize: fontSizes)),
                Text(
                    classBody.values[7] is String
                        ? classBody.values[7]
                        : classBody.values[7].toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
            ]);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
