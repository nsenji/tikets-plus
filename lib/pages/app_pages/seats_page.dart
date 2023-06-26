
import 'package:cinema_tikets/Custom_widgets/metro_seat_widget.dart';
import 'package:cinema_tikets/notifiers/for_acacia/taken_seat_notifier.dart';
import 'package:cinema_tikets/pages/app_pages/ticket_confimation.dart';
// import 'package:cinema_tikets/pages/tickets_booked_page.dart';
import 'package:cinema_tikets/Custom_widgets/acacia_seat_widget.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/for_acacia/seat_methods.dart';
import '../../utils/app_layout.dart';

class BarItemPage extends StatefulWidget {
  String location;
  BarItemPage({super.key, required this.location});

  @override
  State<BarItemPage> createState() => _BarItemPageState();
}

class _BarItemPageState extends State<BarItemPage> {
  @override
  void initState() {
    TakenSeat takenSeat = Provider.of<TakenSeat>(context, listen: false);
    // getSeat(takenSeat);
    // TODO: implement initState
    super.initState();
  }

  int selectedIndex = -1;
  final Color _iconColor = Colors.grey;

  List alpha = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
  ];

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, top: 55),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 0),
                        width: 450,
                        height: 5,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              offset: Offset.zero,
                              spreadRadius: 2,
                              blurStyle: BlurStyle.normal,
                              color: Color.fromRGBO(255, 255, 255, 1))
                        ], color: Colors.white70, shape: BoxShape.rectangle),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        // color: Colors.green,
                        height: 540,
                        width: 460, //480,
                        child: Wrap(
                            spacing: 7,
                            children: List.generate(99, (index) {
                              if (widget.location == "ACACIA") {
                                return Seat(
                                  index: index,
                                );
                              }
                              if (widget.location == "METROPLEX NAALYA") {
                                return Seat_metro(index: index);
                              }
                              return Seat(index: index);
                            })),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              width: 360,
              height: 45,
              child: Row(children: [
                Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.grey),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Available', style: TextStyle(color: Colors.white)),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.orange),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Selected', style: TextStyle(color: Colors.white)),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.blue),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Taken', style: TextStyle(color: Colors.white))
              ]),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  // border: Border.all(
                  //   color: Colors.blue,
                  // ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                width: AppLayout.getWidth(350),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => TicketView(
                                location: widget.location,
                              )))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Text("BOOK SEAT"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}















































// print('BOOOOOOOOoooooooooooooooooooo${widget.location}');
































// Positioned(
              //     left: 10,
              //     top: 120,
              //     child: SizedBox(
              //       height: 540,
              //       width: 20,
              //       child: Column(
              //         children: List.generate(11, (index) {
              //           return Container(
              //             margin: EdgeInsets.only(bottom: 16, top: 15),
              //             child: Text(
              //               alpha[index],
              //               style: TextStyle(
              //                   color: Color.fromARGB(248, 255, 255, 255)),
              //             ),
              //           );
              //         }),
              //       ),
              //     )),






              // Positioned(
              //     top: 660,
              //     right: 300,
              //     child: SizedBox(
              //       height: 80,
              //       width: 80,
              //       // color: Colors.red,
              //       child: Column(

              //         children: [
              //           Row(
              //             children: [
              //               Container(
              //                 height: 9,
              //                 width: 9,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(9),
              //                     color: Colors.orange),
              //               ),
              //               Expanded(child: Container()),
              //               Text('Selected',
              //                   style: TextStyle(color: Colors.white))
              //             ],
              //           ),
              //           Expanded(
              //             child: Container(),
              //             flex: 0,
              //           ),
              //           Container(
              //             margin:  EdgeInsets.only(top: 10),
              //             child: Row(
              //               children: [
              //                 Container(
              //                   height: 9,
              //                   width: 9,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(9),
              //                       color: Colors.grey),
              //                 ),
              //                 Expanded(child: Container()),
              //                 Text('Available',
              //                     style: TextStyle(color: Colors.white))
              //               ],
              //             ),
              //           ),
              //           Container(
              //             margin:  EdgeInsets.only(top: 15),
              //             child: Row(
              //               children: [
              //                 Container(
              //                   height: 9,
              //                   width: 9,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(9),
              //                       color: Colors.white),
              //                 ),
              //                 Expanded(child: Container(), flex: 1),
              //                 Container(
              //                   margin:  EdgeInsets.only(right: 19),
              //                   child: Text('Taken',
              //                       style: TextStyle(color: Colors.white)),
              //                 )
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     ))
     






// this is the white cinema projectoro  screen
              // Positioned(
              //     left: 40,
              //     top: 80,
              //     right: 0,
              //     child: SingleChildScrollView(
              //       scrollDirection: Axis.horizontal,
              //       child: Container(
              //         width: 365,
              //         height: 5,
              //         decoration: BoxDecoration(boxShadow: [
              //           BoxShadow(
              //               blurRadius: 2,
              //               offset: Offset.zero,
              //               spreadRadius: 2,
              //               blurStyle: BlurStyle.normal,
              //               color: Colors.white)
              //         ], color: Colors.white70, shape: BoxShape.rectangle),
              //       ),
              //     )),