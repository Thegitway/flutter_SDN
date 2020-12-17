import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';
import 'package:le_savoir_du_nord/Screens/absence/absence.screen.dart';
import 'package:le_savoir_du_nord/Screens/note/note_screen.dart';
import 'package:le_savoir_du_nord/Screens/note/components/Bodyn.dart';
import 'package:le_savoir_du_nord/Screens/class/class_screen.dart';
import 'package:le_savoir_du_nord/Screens/class/components/Bodyc.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/body.dart';

class Master extends StatefulWidget {
  Master({Key key, this.body}) : super(key: key);
  Widget body;

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  Size size;
  var bottoms;
  var bottomsNull = BottomAppBar();
  void initState() {
    super.initState();
    if (widget.body != Body()) {
      bottoms = BottomAppBar(
        color: Colors.green[400],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.hourglass_full, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AbsenceScreen();
                    },
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.school),
              onPressed: () {
                if (!(this.widget.body is Bodyc)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ClassScreen();
                      },
                    ),
                  );
                } //if
              },
            ),
            IconButton(
              icon: Icon(Icons.note),
              onPressed: () {
                if (!(this.widget.body is Bodyn)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NoteScreen();
                      },
                    ),
                  );
                } //if
              },
            ),
          ],
        ),
      );
    }
  }

  var heightBar = AppBar().preferredSize.height;
  Widget connectionW;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: con(),
        builder: (context, snapshot) {
          connectionW = snapshot.data;

          return Scaffold(
              body: widget.body,
              appBar: AppBar(
                backgroundColor: kPrimaryLightColor,
                centerTitle: true,
                title: Image.asset(
                  "assets/images/logoE.png",
                  width: heightBar,
                  height: heightBar,
                ),
                toolbarHeight: heightBar * 1.2,
                actions: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                    size: 17,
                                  ),
                                ),
                                SelectableText(" : " + studentID,
                                    style: TextStyle(
                                        fontSize: 14, color: kPrimaryColor)),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.vpn_key_outlined,
                                    color: kPrimaryColor,
                                    size: 17,
                                  ),
                                ),
                                SelectableText(
                                  " : " + registerID,
                                  style: TextStyle(
                                      fontSize: 14, color: kPrimaryColor),
                                ),
                              ],
                            ),
                            connectionW == null
                                ? Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Icon(
                                          Icons.wifi,
                                          color: kPrimaryColor,
                                          size: 17,
                                        ),
                                      ),
                                      SelectableText(
                                        " : " + "connection",
                                        style: TextStyle(
                                            fontSize: 14, color: kPrimaryColor),
                                      ),
                                    ],
                                  )
                                : connectionW,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                leading: IconButton(
                  icon: Icon(
                    Icons.menu_open,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    studentID = "null";
                    registerID = "null";
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
              bottomNavigationBar: bottoms);
        });
  }
}

Future<Widget> con() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(
          Icons.wifi,
          color: kPrimaryColor,
          size: 17,
        ),
      ),
      Text(
        ": Connection",
        style: TextStyle(color: kPrimaryColor, fontSize: 14),
      ),
    ]);
  } else
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Icon(
          Icons.wifi,
          color: Colors.red,
          size: 17,
        ),
      ),
      Text(": No connection",
          style: TextStyle(color: Colors.red, fontSize: 14)),
    ]);
}
