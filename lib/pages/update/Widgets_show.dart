import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Custom_widgets/filter_chip.dart';
import '../../Custom_widgets/movie_card.dart';
import '../../Custom_widgets/pine_logo.dart';
import '../../Custom_widgets/red_button.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Pine(),
            SizedBox(
              height: 30,
            ),
            Button(
              text: 'Testing',
              onpressed: () {},
            ),
            SizedBox(
              height: 30,
            ),
            MovieCard(image: 'assets/nsenji.png',),
            SizedBox(
              height: 30,
            ),
            ChipFilter(label: 'Abomination',onpressed: () {
              
            },)
          ],
        ),
      ),
    ));
  }
}