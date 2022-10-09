import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';
import '';
import 'dart:convert';

import '../../utils/styles.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: const Text("My Profile"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "data:image/jpeg;base64,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"),
                          fit: BoxFit.cover)),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Container(
                      alignment: const Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        radius: 60.0,
                        child: Image.asset('assets/images/beach.jpg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  '$userName',
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                // StreamBuilder(builder: builder),
                const Text(
                  "Country",
                  //myCountry,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        child: Text(
                          "Pay With Points",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                "Movies Watched",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "4",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                "Points",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "2000",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 100.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 100.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Cinema Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 400.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Tickets Purchased",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 400.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Movies Watched",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               IntlPhoneField(
//                 decoration: const InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                 ),
//                 initialCountryCode: 'UG',
//                 onChanged: (phone) {
//                   if (kDebugMode) {
//                     print(phone.completeNumber);
//                   }
//                 },
//               ),
//               const TextField(
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   hintText: "Enter Amount",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                 ),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   alertDialog(context);
//                 },
//                 icon: const Icon(Icons.payment),
//                 label: const Text(
//                   'Payment',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   foregroundColor: Colors.black,
//                   minimumSize: const Size(200, 50),
//                   maximumSize: const Size(200, 50),
//                   elevation: 5,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(25),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//     );
//   }
// }

//Function which shows Alert Dialog
alertDialog(BuildContext context) {
  // This is the ok button
  Widget ok = ElevatedButton(
    child: const Text("Okay"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // show the alert dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Payment Successful"),
        content: const Text("Payment for (number of tickets) was successful."),
        icon: const Icon(
          Icons.check_circle,
          size: 70,
          color: Colors.green,
        ),
        actions: [
          ok,
        ],
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      );
    },
  );
}
