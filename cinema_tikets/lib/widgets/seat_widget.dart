import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Seat extends StatefulWidget {
  bool touched;
  Color? seatSelected;
  Color? seatEmpty;
  IconData? icon;
  int index;

  Seat(
      {super.key,
      required this.index,
      this.touched = false,
      this.seatSelected = Colors.orange,
      this.seatEmpty = Colors.white,
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
                widget.touched = true;
                if (widget.touched == true) {
                  widget.seatEmpty = Colors.orange;
                } else {
                  widget.seatEmpty = Colors.white;
                }
              });
            },
            icon: Icon(
              Icons.chair,
              size: 50,
              color: widget.touched == true
                  ? widget.seatEmpty
                  : widget.seatEmpty,
            )));
  }
}
