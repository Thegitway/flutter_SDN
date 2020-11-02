import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/welcome_screen.dart';
import 'package:le_savoir_du_nord/constants.dart';

class MasterDrawer extends StatelessWidget {
  MasterDrawer({Key key, this.body}) : super(key: key);
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.library_books,
                  color: kPrimaryColor,
                ),
                title: Text(
                  "Note",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.school,
                color: kPrimaryColor,
              ),
              title: Text(
                "Class",
                style: TextStyle(fontSize: 18, color: Colors.black),
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
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "   Logout",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
