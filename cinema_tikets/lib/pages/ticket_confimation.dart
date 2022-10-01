import 'package:cinema_tikets/models/seat_number_model.dart';
import 'package:cinema_tikets/utils/app_layout.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Stack(children: [
      Positioned(
        right: 24,
        top: 750,
        left: 20,
        child: Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 50,
            width: 400,
            child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => TicketView()))),
                child: Text("PAYMENT"),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.red)),
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
                    image: AssetImage("assets/korea.jpg"), fit: BoxFit.cover)),
            height: 300,
          )),
      Positioned(
          top: 390,
          right: 25,
          left: 20,
          child: Material(
            color: Colors.black,
            child: Container(
              padding: const EdgeInsets.only(top: 10,left: 10),
              height: 75,
              child: Row(children: [
                Column(
                  children: [
                    Text("${Provider.of<SeatNumberModel>(context, listen: false).totalPrice}")
                  ],
                )
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.blue,
                
              ),
            ),
          )),
      Positioned(
          top: 465,
          right: 25,
          left: 20,
          child: Container(
            height: 265,
            color: Colors.red,
            child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
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
                                child: DecoratedBox(
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
                              SizedBox(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "SEAT NUMBER",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                            "${Provider.of<SeatNumberModel>(context, listen: false).seatNumber[index]}")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          Provider.of<SeatNumberModel>(context,listen: false).seatNumber[index] <21? "Ugx 10000": "Ugx 4000",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
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
    ]);
  }
}
