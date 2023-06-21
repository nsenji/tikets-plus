import 'package:flutter/material.dart';

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
