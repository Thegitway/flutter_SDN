import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/Screens/absence/components/Bodya.dart';
import 'package:le_savoir_du_nord/components/Master.dart';

class AbsenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Master(body: Bodya()),
    );
  }
}
