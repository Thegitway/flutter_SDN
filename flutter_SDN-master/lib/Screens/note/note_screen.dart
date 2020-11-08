import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/note/components/Bodyn.dart';
import 'package:le_savoir_du_nord/components/Master.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Master(body: Bodyn()),
    );
  }
}
