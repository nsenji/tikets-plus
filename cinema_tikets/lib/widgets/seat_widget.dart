import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/seat_number_model.dart';

class Seat extends StatefulWidget {
  bool touched;
  Color? seatColor;
  IconData? icon;
  int index;

  Seat(
      {super.key,
      required this.index,
      this.touched = false,
      this.seatColor = Colors.white,
      this.icon});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            onPressed: () {
              setState(() {
                if (widget.seatColor == Colors.white) {
                  widget.seatColor = Colors.orange;
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .add(widget.index + 1);
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .addPrice(widget.index +1);
                } else {
                  widget.seatColor = Colors.white;
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .remove(widget.index + 1);
                   Provider.of<SeatNumberModel>(context, listen: false)
                      .reducePrice(widget.index +1);

                }
              });
            },
            icon: Icon(
              Icons.chair,
              size: 50,
              color: widget.seatColor,
            )));
  }
}
