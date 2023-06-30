import 'package:cinema_tikets/pages/app_pages/seats_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/styles.dart';
import '../../notifiers/for_acacia/time.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Test',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Test'),
//         ),
//         body: Center(
//             child: Column(
//           children: const [
//             Text('Click the button'),
//             Button(location:widgegt.location ,) // WHERE THIS IS THE CUSTOM WIDGET
//           ],
//         )),
//       ),
//     );
//   }
// }

class Button extends StatefulWidget {
  String location;
 Button({super.key,required this.location});

  @override
  State<Button> createState() => _Button();
}

class _Button extends State<Button> {
  //THE DEFAULT DATE
  String Date = 'No Date';

  // THE DEFAULT TIME
  String Time = 'Open Ticket';

  bool date_is_picked = false;

  bool time_is_picked = false;

  // HERE ARE THE DEFAULT COLORS OF THE UNPICKED DATE BUTTONS
  var Color = {
    'Sun': Styles.primaryColor,
    'Mon': Styles.primaryColor,
    'Tue': Styles.primaryColor,
    'Thur': Styles.primaryColor,
    'Fri': Styles.primaryColor,
    'Sat': Styles.primaryColor,
    'Wed': Styles.primaryColor
  };

  // HERE ARE THE DEFAULT COLORS FOR THE UNPICKED TIME COLORS
  var timeColors = [
    Styles.primaryColor,
    Styles.primaryColor,
    Styles.primaryColor,
    Styles.primaryColor,
    Styles.primaryColor,
    Styles.primaryColor,
    Styles.primaryColor,
  ];

  void setDate({required date}) {
    setState(() {
      Date = date;
      date_is_picked = true;
      Provider.of<Datetime>(context, listen: false).dateNow(Date);
    });
  }

  void unSelectDate() {
    setState(() {
      Date = 'No date';
      date_is_picked = false;
    });
  }

  void setTime({required time}) {
    setState(() {
      Time = time;
      time_is_picked = true;
      Provider.of<Datetime>(context, listen: false).timeNow(Time);
    });
  }

  void unSelectTime() {
    setState(() {
      Time = 'Open Ticket';
      time_is_picked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
         
          child:  const Text('PICK A DATE', 
          //style: Theme.of(context).textTheme.bodyMedium
          ),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                context: context,
                builder: (context) {
                  return Center(
                      child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: -80,
                          child: Container(
                            width: 100,
                            height: 7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                    //THE COLOR OF THAT HORIZONTAL BAR ABOVE THE BOTTOM POP UP
                                ),
                          )),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Center(
                              child: Text(
                            "Choose a Date",
                            style: TextStyle(fontSize: 18, ),
                          )),
                          const SizedBox(height: 30),
                          SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Sun', date: '2'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Mon', date: '3'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Tue', date: '4'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Wed', date: '5'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Thur', date: '6'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Fri', date: '7'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  dateButton(day: 'Sat', date: '8'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )),
                          // Container(
                          //   padding: const EdgeInsets.only(top: 70),
                          //   width: double.infinity,
                          //   height: 130,
                          //   child: ListView.separated(
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) =>
                          //           timeButton(index),
                          //       separatorBuilder: (context, index) =>
                          //           const SizedBox(
                          //             width: 10,
                          //           ),
                          //       itemCount: 7),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          // THIS CONTAINER IS THE "VIEW TICKET" BUTTON
                          Container(
                            // padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                                
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      //DEFINE THE PAGE TO GO WHEN BUTTON IS CLICKED
                                      builder: (context) =>
                                           BarItemPage(location: widget.location,)));
                                },
                                child: const Text('Select Seats')),
                          )
                        ],
                      ),
                    ],
                  ));
                });
          }),
    );
  }

  StatefulBuilder dateButton({required String day, required String date}) {
    return StatefulBuilder(builder: (context, setColor) {
      return ElevatedButton(
          onPressed: () {
            setColor(() {
              if (date_is_picked == false) {
                Color[day] = Colors
                    .purple; // HERE IS WHERE YOU SET THE COLOR OF THE DATE BUTTON AFTER IT IS TAPPED
                // IF U DO CHANGE THE COLOR OF THE SELECTED BUTTON ALSO CHANGE WHERE YOU SEE, FOR EXAMPLE 'Colors.green' TO THE NEW COLOR
                setDate(date: '$day $date');
              } else if (Color[day] == Colors.purple) {
                Color[day] = Styles.primaryColor;
                unSelectDate();
              }
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: Color[day]),
          child: Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(children: [Text(day), Text(date)])));
    });
  }

  StatefulBuilder timeButton(int i) {
    return StatefulBuilder(builder: (context, setColor) {
      return ElevatedButton(
          onPressed: () {
            setColor(() {
              if (time_is_picked == false) {
                timeColors[i] = Colors
                    .purple; // HERE IS WHERE YOU SET THE COLOR OF THE DATE BUTTON AFTER IT IS TAPPED
                // IF U DO CHANGE THE COLOR OF THE SELECTED BUTTON ALSO CHANGE WHERE YOU SEE, FOR EXAMPLE 'Colors.green' TO THE NEW COLOR
                setTime(time: '0$i:30');
              } else if (timeColors[i] == Colors.purple) {
                timeColors[i] = Styles.primaryColor;
                unSelectTime();
              }
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: timeColors[i]),
          child: Text('0$i:30'));
    });
  }
}
