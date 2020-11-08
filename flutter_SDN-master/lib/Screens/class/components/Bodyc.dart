import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';

class Bodyc extends StatelessWidget {
  const Bodyc({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Array(width: size.width, col: [
      /*["Math", "10/20", "15/20"],
      ["Omar", "ok", "fff"],
      ["Omar", "ok", "fff"],
      ["Omar", "ok", "fff"],
      ["Omar", "ok", "fff"],*/
    ]);
  }
}
