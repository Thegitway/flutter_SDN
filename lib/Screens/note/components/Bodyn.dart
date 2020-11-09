import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Absence.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';
import 'package:le_savoir_du_nord/constants.dart';

class Bodyn extends StatefulWidget {
  const Bodyn({
    Key key,
  }) : super(key: key);

  @override
  _BodynState createState() => _BodynState();
}

class _BodynState extends State<Bodyn> {
  double fontSizes;
  Absence AbsenceBody;
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
        future: ClassApi(),
        builder: (context, snapshot) {
          AbsenceBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Array(width: size.width, col: [
              [
                Text("Class ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.class_id is String
                        ? AbsenceBody.class_id
                        : AbsenceBody.class_id.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Student ID", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.stu_id is String
                        ? AbsenceBody.stu_id
                        : AbsenceBody.stu_id.toString(),
                    style: TextStyle(fontSize: fontSizes))
              ],
              [
                Text("Class name", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.cl_name is String
                        ? AbsenceBody.cl_name
                        : AbsenceBody.cl_name.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Class link", style: TextStyle(fontSize: fontSizes)),
                ListTile(
                  title: Icon(
                    Icons.live_tv,
                    size: fontSizes,
                  ),
                  onTap: () async {
                    if (AbsenceBody.url != null) {
                      if (await canLaunch(AbsenceBody.url))
                        launch(AbsenceBody.url);
                    }
                  },
                ),
              ],
              [
                Text("Student last name",
                    style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.Stu_last_name is String
                        ? AbsenceBody.Stu_last_name
                        : AbsenceBody.Stu_last_name.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("term", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.c_term is String
                        ? AbsenceBody.c_term
                        : AbsenceBody.c_term.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Langage", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.lan is String
                        ? AbsenceBody.lan
                        : AbsenceBody.lan.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Level", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.lvl is String
                        ? AbsenceBody.lvl
                        : AbsenceBody.lvl.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
              [
                Text("Attendance", style: TextStyle(fontSize: fontSizes)),
                Text(
                    AbsenceBody.attendances is String
                        ? AbsenceBody.attendances
                        : AbsenceBody.attendances.toString(),
                    style: TextStyle(fontSize: fontSizes)),
              ],
            ]);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
