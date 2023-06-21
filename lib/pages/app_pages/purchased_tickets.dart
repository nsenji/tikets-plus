

import 'package:cinema_tikets/notifiers/for_acacia/location.dart';
import 'package:cinema_tikets/pages/app_pages/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../notifiers/for_acacia/seat_number_notifier.dart';
import '../../utils/app_layout.dart';
import '../../notifiers/for_acacia/time.dart';
import '../../notifiers/for_acacia/title_image_provider.dart';

class Purchased extends StatefulWidget {
  const Purchased({Key? key}) : super(key: key);

  @override
  State<Purchased> createState() => _PurchasedState();
}

class _PurchasedState extends State<Purchased> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<SeatNumberModel>(context, listen: false).items.isEmpty){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Purchased Tickets"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: const Center(child: Text("You have not purchased any tickets yet !", style: TextStyle(fontSize: 20),)),
      );
    } else {
      return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Purchased Tickets"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
          children: [
            Positioned(
                top: 5,
                right: 25,
                left: 20,
                child: Material(
                  color: Colors.black,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    height: 75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.only(right: 45),
                        height: 60,
                        width: 140,
                        child: Column(
                          children: [
                            const Text(
                              "DATE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              Provider.of<Datetime>(context).date,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 15),
                        height: 60,
                        width: 80,
                        child: Column(
                          children: [
                            const Text(
                              "TIME",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(Provider.of<Datetime>(context).time,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15))
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 60,
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          children: [
                            const Text(
                              "TOTAL PRICE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Ugx.${Provider.of<SeatNumberModel>(context, listen: false).totalPrice}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.orange))
                          ],
                        ),
                      )
                    ]),
                  ),
                )),
            Positioned(
                top: 80,
                right: 25,
                left: 20,
                child: SizedBox(
                  height: 1500,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: Provider.of<SeatNumberModel>(context, listen: false)
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
                                      child: const DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)))),
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
                                    const SizedBox(
                                      height: 20,
                                      width: 10,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10)))),
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
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "SEAT NUMBER",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 11),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "${Provider.of<SeatNumberModel>(context, listen: false).seatNumber[index]}",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15))
                                              ],
                                            ),
                                          ),
                                          Expanded(child:
                                            Container(
                                              child: ElevatedButton(
                                                style: const ButtonStyle(
                                                 backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),),
                                                child: const Text("View QR Code", textAlign: TextAlign.center),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    title: null,
                                                    content: SecondPage(date: Provider.of<Datetime>(context).date, time: Provider.of<Datetime>(context).time, movie_name: Provider.of<MovieTitle>(context).title, cinema: Provider.of<Place>(context).location, seat: '${Provider.of<SeatNumberModel>(context, listen: false).seatNumber[index]}')
                                                  )
                                                ),
                                              ),
                                          )),
                                            Container(
                                              padding: const EdgeInsets.only(left: 25),
                                              height: 60,
                                              width: 140,
                                              child: Column(
                                                children: [
                                                  const Text("PRICE",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 11)),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    Provider.of<SeatNumberModel>(
                                                        context,
                                                        listen: false)
                                                        .seatNumber[index] <
                                                        21
                                                        ? "Ugx 10000"
                                                        : "Ugx 4000",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.orange),
                                                  )
                                                ],
                                              ),
                                            ),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ))
          ])
      );
    }
  }
}
