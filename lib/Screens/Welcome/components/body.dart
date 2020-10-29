import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Login/login_screen.dart';
import 'package:le_savoir_du_nord/Screens/Signup/signup_screen.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/background.dart';
import 'package:le_savoir_du_nord/components/rounded_button.dart';
import 'package:le_savoir_du_nord/constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  double _size = 0.25;

  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 0.25 : 0.10;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            GestureDetector(
              onTap: () => _updateSize(),
              child: Container(
                child: AnimatedSize(
                  curve: Curves.decelerate,
                  vsync: this,
                  duration: Duration(seconds: 5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/logo.png"),
                    radius: size.width * _size,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.07),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
