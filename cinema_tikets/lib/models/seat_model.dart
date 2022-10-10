import 'dart:ui';

import 'package:cinema_tikets/api/movie_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../notifiers/seat_number_notifier.dart';

class Seat extends StatefulWidget {
  bool taken;
  Color? seatColor;
  IconData? icon;
  int index;

  Seat(
      {super.key,
      required this.index,
      this.taken = false,
      this.seatColor = Colors.white,
      this.icon});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  void initState() {
    // getSeat(Provider.of<SeatNumberModel>(context, listen: false));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<SeatNumberModel>(context, listen: false).seatList.contains(widget.index) ){
      widget.taken = true;
    }
    return Container(
        child: IconButton(
          disabledColor: Colors.blue,
          enableFeedback: widget.taken == true?false:true,
            onPressed: () {
              setState(() {
                if (widget.seatColor == Colors.white) {
                  widget.seatColor = Colors.orange;
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .add(widget.index + 1);
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .addPrice(widget.index + 1);
                } else {
                  widget.seatColor = Colors.white;
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .remove(widget.index + 1);
                  Provider.of<SeatNumberModel>(context, listen: false)
                      .reducePrice(widget.index + 1);
                }
              });

              addSeat(
                  Provider.of<SeatNumberModel>(context, listen: false).items);
            },
            icon: Icon(
              Icons.chair,
              size: 50,
              color: widget.seatColor,
            )));
  }
}
