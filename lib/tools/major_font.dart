//import 'dart:html';

import 'package:flutter/material.dart';

class MajorFont extends StatelessWidget {
  double size;
  final String text;
  final Color color;


   MajorFont({
     super.key,
      required this.text,
      this.color = Colors.black,
       this.size = 35
       });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      )

      );
  }
}
