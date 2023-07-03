import 'package:cinema_tikets/notifiers/for_acacia/seat_number_notifier.dart';
import 'package:cinema_tikets/notifiers/for_metro/seat_number_notifier-metro.dart';
import 'package:cinema_tikets/notifiers/for_acacia/time.dart';
import 'package:cinema_tikets/utils/app_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/for_acacia/title_image_provider.dart';

class TicketView extends StatelessWidget {
  String location;
  TicketView({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Stack(children: [
        
        Positioned(
            top: AppLayout.getHeight(20),
            right: AppLayout.getWidth(25),
            left: AppLayout.getWidth(20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/${Provider.of<MovieImage>(context).image}"),
                      fit: BoxFit.cover)),
              height: AppLayout.getHeight(300),
            )),
        Positioned(
            top: AppLayout.getHeight(320),
            right: AppLayout.getWidth(25),
            left: AppLayout.getWidth(20),
            child: Material(
              color: Colors.black,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(10),
                      left: AppLayout.getWidth(10)),
                  height: AppLayout.getHeight(75),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(right: AppLayout.getWidth(45)),
                          height: AppLayout.getHeight(60),
                          // width: AppLayout.getWidth(140),
                          child: Column(
                            children: [
                              const Text(
                                "DATE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 11),
                              ),
                              SizedBox(
                                height: AppLayout.getHeight(10),
                              ),
                              Text(
                                Provider.of<Datetime>(context).date,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        // Expanded(child: Container()),
                        Container(
                          padding:
                              EdgeInsets.only(right: AppLayout.getWidth(15)),
                          height: AppLayout.getHeight(60),
                          // width: AppLayout.getWidth(60),
                          child: Column(
                            children: [
                              const Text(
                                "TIME",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 11),
                              ),
                              SizedBox(
                                height: AppLayout.getHeight(10),
                              ),
                              const Text('14:30',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))
                            ],
                          ),
                        ),
                        // Expanded(child: Container()),
                        Container(
                          // width: AppLayout.getWidth(130),
                          height: AppLayout.getHeight(60),
                          padding:
                              EdgeInsets.only(left: AppLayout.getWidth(35)),
                          child: Column(
                            children: [
                              const Text(
                                "TOTAL PRICE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 11),
                              ),
                              SizedBox(
                                height: AppLayout.getHeight(10),
                              ),
                              Text(
                                  location == "METROPLEX NAALYA"
                                      ? "Ugx.${Provider.of<SeatNumberModel_metro>(context, listen: false).totalPrice}"
                                      : "Ugx.${Provider.of<SeatNumberModel>(context, listen: false).totalPrice}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      ))
                            ],
                          ),
                        )
                      ]),
                );
              }),
            )),
        Positioned(
            top: AppLayout.getHeight(465),
            right: AppLayout.getWidth(25),
            left: AppLayout.getWidth(20),
            child: SizedBox(
              height: AppLayout.getHeight(265),
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: location == "METROPLEX NAALYA"
                      ? Provider.of<SeatNumberModel_metro>(context,
                              listen: false)
                          .items
                          .length
                      : Provider.of<SeatNumberModel>(context, listen: false)
                          .items
                          .length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.only(top: AppLayout.getHeight(0)),
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(top: AppLayout.getHeight(0)),
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
                                              bottomRight:
                                                  Radius.circular(10)))),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.all(AppLayout.getWidth(12.0)),
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize:
                                            MainAxisSize.max, //Builder here
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            (constraints.constrainWidth() / 15)
                                                .floor(),
                                            (index) => SizedBox(
                                                  //try changing this back to a sized box
                                                  width: AppLayout.getWidth(5),
                                                  height:
                                                      AppLayout.getHeight(1),
                                                  child: const DecoratedBox(
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
                                  height: AppLayout.getHeight(20),
                                  width: AppLayout.getWidth(10),
                                  child: const DecoratedBox(
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
                                  height: AppLayout.getHeight(80),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: AppLayout.getHeight(60),
                                        width: AppLayout.getWidth(140),
                                        padding: EdgeInsets.only(
                                            right: AppLayout.getWidth(10)),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "SEAT NUMBER",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 11),
                                            ),
                                            SizedBox(
                                              height: AppLayout.getHeight(10),
                                            ),
                                            Text(
                                                location == "METROPLEX NAALYA"
                                                    ? "${Provider.of<SeatNumberModel_metro>(context, listen: false).seatNumber[index]}"
                                                    : "${Provider.of<SeatNumberModel>(context, listen: false).seatNumber[index]}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                          ],
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: AppLayout.getWidth(25)),
                                        height: AppLayout.getHeight(60),
                                        width: AppLayout.getWidth(140),
                                        child: Column(
                                          children: [
                                            const Text("PRICE",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11)),
                                            SizedBox(
                                              height: AppLayout.getHeight(10),
                                            ),
                                            Text(
                                              location == "METROPLEX NAALYA"
                                                  ? Provider.of<SeatNumberModel_metro>(
                                                                      context,
                                                                      listen: false)
                                                                  .seatNumber[
                                                              index] <
                                                          20
                                                      ? "Ugx 15000"
                                                      : "Ugx 10000"
                                                  : Provider.of<SeatNumberModel>(
                                                                  context,
                                                                  listen: false)
                                                              .seatNumber[index] <
                                                          20
                                                      ? "Ugx 15000"
                                                      : "Ugx 10000",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                 ),
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
            )
            ),
            Positioned(
          right: AppLayout.getWidth(24),
          top: AppLayout.getHeight(600),
          left: AppLayout.getWidth(20),
          child: Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => TicketView(
                            location: location,
                          )))),
              
              child: const Text("PAYMENT"),
            ),
          ),
        ),
      ]),
    );
  }
}
