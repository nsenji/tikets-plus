import 'dart:ui';

import 'package:cinema_tikets/api/movie_api.dart';
import 'package:cinema_tikets/notifiers/taken_seat_notifier.dart';
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
  // dynamic value;
  @override
  void initState() {
    print('yeah the list is empty');
    print('yeah the list is empty');
    print('yeah the list is empty');
    print('yeah the list is empty');
    int index = 0;
    TakenSeat takenSeat = Provider.of<TakenSeat>(context, listen: false);
    List stuff = takenSeat.seatList[index].seat;
    if (takenSeat.seatList[0].seat != null) {
      if (stuff.contains(widget.index + 1)) {
        setState(() {
          widget.taken = true;
        });
      }
    } else {
      print('yeah the list is empty');
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            disabledColor: Colors.blue,
            // enableFeedback: widget.taken == true?false:true,
            onPressed: widget.taken == true
                ? null
                : () {
                    setState(() {
                      if (widget.seatColor == Colors.white) {
                        widget.seatColor = Colors.orange;
                        Provider.of<SeatNumberModel>(context, listen: false)
                            .add(widget.index + 1);
                        Provider.of<SeatNumberModel>(context, listen: false)
                            .addPrice(widget.index + 1);
                        addSeat(widget.index);
                      } else {
                        widget.seatColor = Colors.white;
                        Provider.of<SeatNumberModel>(context, listen: false)
                            .remove(widget.index + 1);
                        Provider.of<SeatNumberModel>(context, listen: false)
                            .reducePrice(widget.index + 1);
                        
                      }
                    });
                  },
            icon: Icon(
              Icons.chair,
              size: 50,
              color: widget.taken == true ? Colors.blue : widget.seatColor,
            )));
  }
}
