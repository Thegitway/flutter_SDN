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
  double fontSizes = 23;
  double olds;
  Absence classBody;
  @override
  void initState() {
    super.initState();
    olds = fontSizes;
    ClassApi().then((value) {
      setState(() {
        classBody = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //api
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Array(width: size.width, col: [
        [
          Text("Class ID", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.class_id is String
                  ? classBody.class_id
                  : classBody.class_id.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
        [
          Text("Student ID", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.stu_id is String
                  ? classBody.stu_id
                  : classBody.stu_id.toString(),
              style: TextStyle(fontSize: fontSizes))
        ],
        [
          Text("Class name", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.cl_name is String
                  ? classBody.cl_name
                  : classBody.cl_name.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
        [
          Text("Class link", style: TextStyle(fontSize: fontSizes)),
          ListTile(
            title: Icon(Icons.live_tv),
            onTap: () async {
              launch("https://flutter.dev");
            },
          ),
        ],
        [
          Text("Student last name", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.Stu_last_name is String
                  ? classBody.Stu_last_name
                  : classBody.Stu_last_name.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
        [
          Text("term", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.c_term is String
                  ? classBody.c_term
                  : classBody.c_term.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
        [
          Text("Langage", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.lan is String
                  ? classBody.lan
                  : classBody.lan.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
        [
          Text("Level", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.lvl is String
                  ? classBody.lvl
                  : classBody.lvl.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
        [
          Text("Attendance", style: TextStyle(fontSize: fontSizes)),
          Text(
              classBody.attendances is String
                  ? classBody.attendances
                  : classBody.attendances.toString(),
              style: TextStyle(fontSize: fontSizes)),
        ],
      ]),
      backgroundColor: kPrimaryColor,
    );
  }
}
