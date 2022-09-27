import 'package:cinema_tikets/models/seat_number_model.dart';
import 'package:cinema_tikets/utils/app_layout.dart';
import 'package:cinema_tikets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/styles.dart';

class TicketView extends StatelessWidget {
  
  const TicketView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Stack(
      children:[
        Positioned(
          right:24 ,
          top:750 ,
          left: 25,
          child: Center(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: ((context) => TicketView()))),
                        child: Text("PAYMENT"),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.red)),
                  ),
                ),

        ),
        Positioned(
          top: 100,
          right: 25,
          left: 20,
          child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/korea.jpg"),
                fit: BoxFit.cover
              )
            ),
            height:350,
          )
        ),
         Positioned(
           top: 450,
           right: 10,
           left: 20,
           child: SizedBox(
                 width: size.width*0.85,
                 height: AppLayout.getHeight(400),
                 child: Container(
            margin:  EdgeInsets.only(right:AppLayout.getHeight(16)),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 231, 231),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(AppLayout.getHeight(21)),
                    topRight: Radius.circular(AppLayout.getHeight(21))),),
                  padding:  EdgeInsets.all(AppLayout.getHeight(16)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Material(color:Color.fromARGB(255, 236, 231, 231),child: Text("Price of the movie ", style: TextStyle(fontWeight:FontWeight.bold,fontSize:25,color: Color.fromARGB(255, 0, 0, 0)),)),
                          Expanded(child: Container(color: Colors.red,)),
                          // const ThickContainer(),
                          Expanded(child: Stack(
                            children: [
                              // SizedBox(
                              //   height: AppLayout.getHeight(24),
                              //   child: LayoutBuilder(
                              //       builder: (BuildContext context, BoxConstraints constraints) {
                              //         return Flex(
                              //           direction: Axis.horizontal,
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           mainAxisSize: MainAxisSize.max,
                              //           children:
                              //           List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                              //             height:AppLayout.getHeight(1),
                              //             width: AppLayout.getWidth(3),
                              //             child:const DecoratedBox(decoration: BoxDecoration(color: Colors.blue),),
                              //           )),
                              //         );
                              //       }
                              //   ),
                              // ),
                              // Center(child: Transform.rotate(
                              //   angle: 1.5,
                              //   child:const Icon(Icons.local_airport_rounded,
                              //       color:Colors.white),)),
                            ],
                          )),
                          const ThickContainer(),
                          const Spacer(),
                          Material(color:Color.fromARGB(255, 236, 231, 231),child: Text("Acacia", style: TextStyle(fontSize:16,color: Color.fromARGB(255, 0, 0, 0)),))
                        ],
                      ),
                       SizedBox(height: AppLayout.getHeight(10)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     SizedBox(
                      //       width: AppLayout.getWidth(100),
                      //       child: Text("yoo", style:Styles.headLineStyle4.copyWith(color:Colors.black54)),
                      //     ),
                      //     Text("yoo", style: Styles.headLineStyle4.copyWith(color:Colors.black54),),
                      //     SizedBox(
                      //       width: AppLayout.getWidth(100), child: Text("yoo", textAlign: TextAlign.end, style: Styles.headLineStyle4.copyWith(color:Colors.black54),),
                      //     )
                      //   ],
                      // ),
             
                    ],
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Row(
                    children: [
                      SizedBox(
                        height: AppLayout.getHeight(20),
                        width:AppLayout.getWidth(10),
                        child: DecoratedBox(decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)))),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints){
                            return Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              direction: Axis.horizontal,
                              children:List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                                width: 5,
                                height: 1,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 0, 0)
                                  ),
                                ),
                              )),
                            );
                          },
                        ),
                      )),
                      SizedBox(
                        height: 20,
                        width:10,
                        child: DecoratedBox(decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)))),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration:  BoxDecoration(
                    color: Colors.red,
                    borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(21),
                        bottomRight: Radius.circular(21)),),
                  padding: const EdgeInsets.only(left: 16, top:10, right: 16, bottom: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(margin: const EdgeInsets.only(bottom: 5),
                                child: Material(color:Colors.red,child: Text("SEAT", style: TextStyle(fontSize:14,color:Color.fromARGB(255, 236, 231, 231))))),
                              const SizedBox(height: 5),
                               Container(margin: const EdgeInsets.only(left: 5),
                                 child: Consumer<SeatNumberModel>(builder:((context, number, child) => Material(color:Colors.red,child: Text("${number.seatNumber}", style: TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Color.fromARGB(255, 0, 0, 0)))))
                                 ),
                               )],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(margin: const EdgeInsets.only(bottom: 5),
                                child: Material(color:Colors.red,child: Text("DATE", style: TextStyle(fontSize:14,color:Color.fromARGB(255, 236, 231, 231))))),
                              const SizedBox(height: 5),
                               Material(color:Colors.red,child: Text("date", style: TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Color.fromARGB(255, 0, 0, 0))))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(margin: const EdgeInsets.only(bottom: 5,right: 5),
                                child: Material(color:Colors.red,child: Text("TIME", style: TextStyle(fontSize:14,color:Color.fromARGB(255, 236, 231, 231))))),
                              const SizedBox(height: 5),
                              Material(color:Colors.red,child: Text("time", style: TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Color.fromARGB(255, 0, 0, 0))))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
                 ),
               ),
         ),
      ]) ;
      }
}
