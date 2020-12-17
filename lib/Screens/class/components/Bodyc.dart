import 'package:le_savoir_du_nord/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';
import 'package:le_savoir_du_nord/components/Class.dart';
import 'package:le_savoir_du_nord/components/Json/JsonM.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/body.dart';
import 'package:le_savoir_du_nord/components/RowButton.dart';
import 'package:le_savoir_du_nord/components/Master.dart';

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
    fontSizes = MediaQuery.of(context).devicePixelRatio * 5;
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getApiClass(urlClass + '${studentID}/${registerID}'),
        builder: (context, snapshot) {
          classBody = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            if (Class.maxPage != -1) {
              Body.titre = "";
              RowButton.iam = 1;
              List<String> namess = <String>[];
              for (int i = 0; i < Class.maxPage; i++)
                namess.add((i + 1).toString() + ") " + classBody.values[i][6]);
              return Master(
                body: Scaffold(
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
                      Text("Nom de classe",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          classBody.values[Class.actuelPage][2] is String
                              ? classBody.values[Class.actuelPage][2]
                              : classBody.values[Class.actuelPage][2]
                                  .toString(),
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
                          if (classBody.values[Class.actuelPage][3] != null) {
                            if (await canLaunch(
                                classBody.values[Class.actuelPage][3]))
                              launch(classBody.values[Class.actuelPage][3]);
                          }
                        },
                      ),
                    ],
                    [
                      Text("Terme de classe",
                          style: TextStyle(fontSize: fontSizes)),
                      Text(
                          classBody.values[Class.actuelPage][5] is String
                              ? classBody.values[Class.actuelPage][5]
                              : classBody.values[Class.actuelPage][5]
                                  .toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Langage", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          classBody.values[Class.actuelPage][6] is String
                              ? classBody.values[Class.actuelPage][6]
                              : classBody.values[Class.actuelPage][6]
                                  .toString(),
                          style: TextStyle(fontSize: fontSizes)),
                    ],
                    [
                      Text("Niveau", style: TextStyle(fontSize: fontSizes)),
                      Text(
                          classBody.values[Class.actuelPage][7] is String
                              ? classBody.values[Class.actuelPage][7]
                              : classBody.values[Class.actuelPage][7]
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
