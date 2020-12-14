import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';
import 'package:le_savoir_du_nord/Screens/absence/absence.screen.dart';
import 'package:le_savoir_du_nord/Screens/note/note_screen.dart';
import 'package:le_savoir_du_nord/Screens/note/components/Bodyn.dart';
import 'package:le_savoir_du_nord/Screens/class/class_screen.dart';
import 'package:le_savoir_du_nord/Screens/class/components/Bodyc.dart';
import 'package:le_savoir_du_nord/constants.dart';

class Master extends StatefulWidget {
  Master({Key key, this.body}) : super(key: key);
  Widget body;

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  Size size;
  void initState() {
    super.initState();
  }

  var heightBar = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.body,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
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
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.person,
                            color: kPrimaryLightColor,
                            size: 17,
                          ),
                        ),
                        SelectableText(" : " + studentID,
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.vpn_key_outlined,
                            color: kPrimaryLightColor,
                            size: 17,
                          ),
                        ),
                        SelectableText(" : " + registerID,
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu_open),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.hourglass_full),
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
      ),
    );
  }
}
