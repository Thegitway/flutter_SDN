import 'package:flutter/material.dart';
import 'package:le_savoir_du_nord/components/Array.dart';

class Bodyn extends StatelessWidget {
  const Bodyn({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Array(
      row: 2,
      column: 2,
    );
  }
}
