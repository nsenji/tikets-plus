import 'package:cinema_tikets/Custom_widgets/filter_chip.dart';
import 'package:flutter/material.dart';

import '../../Custom_widgets/movie_card.dart';
import '../../Custom_widgets/red_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
