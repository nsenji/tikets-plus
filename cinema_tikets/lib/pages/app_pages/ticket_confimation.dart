import 'package:cinema_tikets/notifiers/seat_number_notifier.dart';
import 'package:cinema_tikets/utils/app_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/payment.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Positioned(
          right: 24,
          top: 750,
          left: 20,
          child: Center(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 50,
              width: 400,
              child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Payments()))),
                  child: Text("PAYMENT"),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.orange)),
            ),
          ),
        ),
        Positioned(
            top: 90,
            right: 25,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/korea.jpg"),
                      fit: BoxFit.cover)),
              height: 300,
            )),
        Positioned(
            top: 390,
            right: 25,
            left: 20,
            child: Material(
              color: Colors.black,
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                height: 75,
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.only(right: 45),
                    height: 60,
                    width: 140,
                    child: Column(
                      children: [
                        Text(
                          "DATE",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 11),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "31 Feb 22",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    height: 60,
                    width: 80,
                    child: Column(
                      children: [
                        Text(
                          "TIME",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 11),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("13:34",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15))
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 60,
                    padding: EdgeInsets.only(left: 35),
                    child: Column(
                      children: [
                        Text(
                          "TOTAL PRICE",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 11),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Ugx.${Provider.of<SeatNumberModel>(context, listen: false).totalPrice}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.orange))
                      ],
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
            top: 465,
            right: 25,
            left: 20,
            child: Container(
              height: 265,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  itemCount:
                      Provider.of<SeatNumberModel>(context, listen: false)
                          .items
                          .length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 0),
                            color: Colors.white,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: AppLayout.getHeight(20),
                                  width: AppLayout.getWidth(10),
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10)))),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            (constraints.constrainWidth() / 15)
                                                .floor(),
                                            (index) => const SizedBox(
                                                  width: 5,
                                                  height: 1,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0)),
                                                  ),
                                                )),
                                      );
                                    },
                                  ),
                                )),
                                SizedBox(
                                  height: 20,
                                  width: 10,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft:
                                                  Radius.circular(10)))),
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: Material(
                              child: Container(
                                  height: 80,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 140,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              "SEAT NUMBER",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 11),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                "${Provider.of<SeatNumberModel>(context, listen: false).seatNumber[index]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                          ],
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        padding: EdgeInsets.only(left: 25),
                                        height: 60,
                                        width: 140,
                                        child: Column(
                                          children: [
                                            Text("PRICE",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              Provider.of<SeatNumberModel>(
                                                              context,
                                                              listen: false)
                                                          .seatNumber[index] <
                                                      2
                                                  ? "Ugx 10000"
                                                  : "Ugx 4000",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.orange),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ))
      ]),
    );
  }
}
