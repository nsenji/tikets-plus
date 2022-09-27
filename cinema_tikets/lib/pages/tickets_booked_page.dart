import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TicketsBooked extends StatefulWidget {
  const TicketsBooked({super.key});

  @override
  State<TicketsBooked> createState() => _TicketsBookedState();
}

class _TicketsBookedState extends State<TicketsBooked> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "this is where the tickets booked are "
          
        ),
      ),
    );
  }
}