import 'package:cinema_tikets/pages/app_pages/purchased_tickets.dart';
import 'package:cinema_tikets/pages/auth_pages/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../notifiers/seat_number_notifier.dart';
import '../../utils/styles.dart';
import 'package:flutter/services.dart';

import '../auth_pages/log_in_screen.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var email = user?.email;
    var uid = user?.uid;

    int points(tickets) {
      int total = tickets * 100;
      return total;
    }

    int tickets =
        Provider.of<SeatNumberModel>(context, listen: false).items.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        title: const Text("My Profile"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  alignment: const Alignment(0.0, 2.5),
                ),
              ),
              const Text(
                "User Unique ID",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                uid.toString(),
                style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 25),
              const Text(
                "User Email",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                email.toString(),
                style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              // StreamBuilder(builder: builder),
              const SizedBox(
                height: 10,
              ),
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
                          children: [
                            const Text(
                              "Tickets",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              tickets.toString(),
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Points",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              points(Provider.of<SeatNumberModel>(context,
                                          listen: false)
                                      .items
                                      .length)
                                  .toString(),
                              style: const TextStyle(
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
                    child: InkWell(
                      onTap: () => {},
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
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Purchased())),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 350.0,
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
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          await _auth.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              new MaterialPageRoute(
                                  builder: (context) => new LogInScreen()),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(150, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
