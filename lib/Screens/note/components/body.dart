import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Login/components/background.dart';
import 'package:le_savoir_du_nord/Screens/Signup/signup_screen.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';
import 'package:le_savoir_du_nord/components/already_have_an_account_acheck.dart';
import 'package:le_savoir_du_nord/components/rounded_button.dart';
import 'package:le_savoir_du_nord/components/rounded_input_field.dart';
import 'package:le_savoir_du_nord/components/rounded_password_field.dart';
import 'package:le_savoir_du_nord/constants.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/body.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Size size;
  var heightBar = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: heightBar,
          height: heightBar,
        ),
        toolbarHeight: heightBar * 1.2,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Stack(
              overflow: Overflow.clip,
              children: [
                Image.asset(
                  "assets/images/Drawer_back.jpg",
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.1
                          : MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.1
                          : MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  heightFactor: 9,
                ),
              ],
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.mark_chat_read_outlined, size: 20),
                      ),
                      TextSpan(
                        text: "   Note",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              autofocus: true,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.class_, size: 20),
                      ),
                      TextSpan(
                        text: "   Class",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: FlatButton(
                color: kPrimaryColor,
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
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}