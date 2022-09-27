import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  bool? isResponsive;
  double? width;


   Button({super.key,this.width,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width=110,
      height:50,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.circular(10),
        color: Colors.blueAccent

      ),
      // child: Row(children: [
      //   Image.asset("assets/")
      // ],)
    );
  }
}
