import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';
import 'package:le_savoir_du_nord/Screens/note/note_screen.dart';
import 'package:le_savoir_du_nord/Screens/note/components/Bodyn.dart';
import 'package:le_savoir_du_nord/Screens/class/class_screen.dart';
import 'package:le_savoir_du_nord/Screens/class/components/Bodyc.dart';
import 'package:le_savoir_du_nord/constants.dart';

class Master extends StatelessWidget {
  Master({Key key, this.body}) : super(key: key);
  Size size;
  var heightBar = AppBar().preferredSize.height;
  Widget body;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: body,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: heightBar,
          height: heightBar,
        ),
        toolbarHeight: heightBar * 1.2,
        actions: [
          IconButton(
              icon: Icon(
                Icons.person,
                color: kPrimaryLightColor,
              ),
              onPressed: () {})
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
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
            IconButton(
              icon: Icon(Icons.school),
              onPressed: () {
                if (!(this.body is Bodyc)) {
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
              icon: Icon(Icons.person),
              onPressed: () {
                if (!(this.body is Bodyn)) {
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
