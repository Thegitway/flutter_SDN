import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    fontSizes = MediaQuery.of(context).devicePixelRatio * 8;
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getApiAbsence(urlAbsence, absenceBody),
        builder: (context, snapshot) {
          absenceBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Array(width: size.width, col: [
              [
                Text("Class ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.class_id is String
                        ? absenceBody.class_id
                        : absenceBody.class_id.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Student ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.stu_id is String
                        ? absenceBody.stu_id
                        : absenceBody.stu_id.toString(),
                    style: TextStyle(fontSize: fontSizes))
              ],
              [
                Text("Class name", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.cl_name is String
                        ? absenceBody.cl_name
                        : absenceBody.cl_name.toString(),
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
                    if (absenceBody.url != null) {
                      if (await canLaunch(absenceBody.url))
                        launch(absenceBody.url);
                    }
                  },
                ),
              ],
              [
                Text("Student last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.Stu_last_name is String
                        ? absenceBody.Stu_last_name
                        : absenceBody.Stu_last_name.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("term", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.c_term is String
                        ? absenceBody.c_term
                        : absenceBody.c_term.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Langage", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.lan is String
                        ? absenceBody.lan
                        : absenceBody.lan.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Level", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.lvl is String
                        ? absenceBody.lvl
                        : absenceBody.lvl.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Attendance", style: TextStyle(fontSize: fontSizes)),
                Text(
                    absenceBody.attendances is String
                        ? absenceBody.attendances
                        : absenceBody.attendances.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
            ]);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
