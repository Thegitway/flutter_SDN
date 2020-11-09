import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/background.dart';
import 'package:le_savoir_du_nord/Screens/note/note_screen.dart';
import 'package:le_savoir_du_nord/components/rounded_button.dart';
import 'package:le_savoir_du_nord/components/rounded_input_field.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  double _size = 0.25;
  Orientation ori;
  Orientation oldOri;

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
              "WELCOM TO SAVOIR DU NORD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            AnimatedContainer(
              curve: Curves.decelerate,
              duration: Duration(seconds: 1),
              width: size.width * _size,
              height: size.width * _size,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.png"),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.07),
            RoundedInputField(
              hintText: "Student ID",
              onChanged: (value) {
                setState(() {
                  studentID = value;
                });
              },
            ),
            RoundedInputField(
              hintText: "Register ID",
              onChanged: (co) {
                setState(() {
                  registerID = co;
                });
              },
              icon: Icons.assistant_photo,
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
