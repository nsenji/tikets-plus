import 'package:cinema_tikets/pages/app_pages/seats_page.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class SecondPage extends StatelessWidget {
  final String date,time;
  const SecondPage({super.key, required this.date,required this.time});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Confirmation',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Date Confirmation'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Styles.primaryColor,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
                children:  [
                  Text('Your movie will be shown on $date'),
                  Text('At this time $time'),
                  ElevatedButton(
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xEFFF1010))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          //DEFINE THE PAGE TO GO WHEN BUTTON IS CLICKED
                            builder: (context) => const BarItemPage()));
                      },
                      child: const Text('Proceed to book Seat'))
                ]),
          ),
        ),
        ),
    );
  }
}