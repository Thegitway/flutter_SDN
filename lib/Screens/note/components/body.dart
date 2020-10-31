import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Login/components/background.dart';
import 'package:le_savoir_du_nord/Screens/Signup/signup_screen.dart';
import 'package:le_savoir_du_nord/components/already_have_an_account_acheck.dart';
import 'package:le_savoir_du_nord/components/rounded_button.dart';
import 'package:le_savoir_du_nord/components/rounded_input_field.dart';
import 'package:le_savoir_du_nord/components/rounded_password_field.dart';

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
      ),
    );
  }
}
