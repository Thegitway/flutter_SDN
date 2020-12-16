import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/background.dart';
import 'package:le_savoir_du_nord/Screens/note/note_screen.dart';
import 'package:le_savoir_du_nord/components/rounded_button.dart';
import 'package:le_savoir_du_nord/components/rounded_input_field.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  static String titre = "";
  static bool bot = false;
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  double _size = 0.40;
  Orientation ori;
  Orientation oldOri;
  void initState() {
    super.initState();
  }

  void _updateSize() {
    setState(() {
      oldOri = ori;
      _size = ori == Orientation.portrait ? 0.35 : 0.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ori = MediaQuery.of(context).orientation;

    if (oldOri != ori) _updateSize();
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOM TO EMSI",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            AnimatedContainer(
              curve: Curves.decelerate,
              duration: Duration(seconds: 1),
              width: size.width * 0.7,
              height: size.width * 0.4,
              child: Image.asset(
                "assets/images/logoEE.png",

                //backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.07),
            Text(
              Body.titre,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
            RoundedInputField(
              hintText: "Student ID",
              onChanged: (value) {
                setState(() {
                  studentID != "" ? studentID = value : studentID = "null";
                });
              },
            ),
            RoundedInputField(
              hintText: "Register ID",
              onChanged: (co) {
                setState(() {
                  if (co != "")
                    registerID = co;
                  else
                    registerID = "null";
                });
              },
              icon: Icons.vpn_key_outlined,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NoteScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
