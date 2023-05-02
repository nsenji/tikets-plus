import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SecondPage extends StatelessWidget {
  final String date,time,movie_name,cinema, seat;
  const SecondPage({super.key, required this.date,required this.time,required this.movie_name,required this.cinema, required this.seat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: 250,
        child:  Center(
          child: Card(
              child: QRCODE(date: date, time: time, movie_name: movie_name, cinema: cinema, seat: seat,)// THE CUSTOM QRCODE WIDGET
          ),
        )
    );
  }
}

// ignore: must_be_immutable
class QRCODE extends StatelessWidget {
  // ignore: non_constant_identifier_names
  QRCODE({super.key,required this.date,required this.time,required this.movie_name,required this.cinema, required this.seat});// Place all the variables you want the qr code to store in here
  
  // ignore: non_constant_identifier_names
  String date,time,movie_name,cinema, seat;
  late String data = '$date $time $movie_name $cinema $seat';


  @override 
  Widget build(BuildContext context) {
   return QrImage(
    data: data,
    size: 180,
   ); 
   
  }

}