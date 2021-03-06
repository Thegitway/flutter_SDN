import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/background.dart';
import 'package:le_savoir_du_nord/Screens/class/class_screen.dart';
import 'package:le_savoir_du_nord/components/rounded_button.dart';
import 'package:le_savoir_du_nord/components/rounded_input_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  static String titre = "";
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
            SizedBox(height: size.height * 0.035),
            MaterialButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Espace privé",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
              color: Colors.indigoAccent,
              onPressed: () async {
                if (await canLaunch(
                    "http://lesavoirdunord.herokuapp.com/login"))
                  launch(
                    "http://lesavoirdunord.herokuapp.com/login",
                    enableJavaScript: true,
                    forceWebView: true,
                  );
              },
            ),
            SizedBox(height: size.height * 0.035),
            Text(
              Body.titre,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
            ),
            RoundedInputField(
              hintText: "Student ID",
              onChanged: (value) {
                setState(() {
                  studentID != "" ? studentID = value : studentID = "incorrect";
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
                    registerID = "incorrect";
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
                      return ClassScreen();
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
