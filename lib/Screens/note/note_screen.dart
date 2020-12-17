import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/note/components/Bodyn.dart';
import 'package:le_savoir_du_nord/components/Master.dart';
import 'package:le_savoir_du_nord/Screens/Welcome/components/body.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bodyn(),
    );
  }
}
