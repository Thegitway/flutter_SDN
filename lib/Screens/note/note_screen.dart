import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Master.dart';
import 'package:le_savoir_du_nord/Screens/note/components/Body.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Master(body: Body()),
    );
  }
}
