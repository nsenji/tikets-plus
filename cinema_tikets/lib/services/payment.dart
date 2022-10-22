import 'dart:io';
import 'dart:math';
import 'package:cinema_tikets/notifiers/for_acacia/seat_number_notifier.dart';
import 'package:cinema_tikets/pages/app_pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:provider/provider.dart';
import '../pages/app_pages/models/title_image_provider.dart';
import '../utils/styles.dart';

class Payments extends StatefulWidget {
  String location;
   Payments({Key? key, required this.location}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final TextEditingController _phoneNum = TextEditingController();

  var user = FirebaseAuth.instance.currentUser;

  String? _ref;

  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);

    if (!kIsWeb && Platform.isAndroid) {
      setState(() {
        _ref = 'AndroidRef1789$number';
      });
    } else {
      setState(() {
        _ref = 'IOSRef1789$number';
      });
    }
  }

  dynamic discount(int amount, int points) {
    if (Provider.of<Points>(context, listen: false).points > 500) {
      return amount * 0.95;
    } else if (Provider.of<Points>(context, listen: false).points > 800) {
      return amount * 0.9;
    } else {
      return amount * 0.85;
    }
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic points = Provider.of<Points>(context, listen: false).points;
    final TextEditingController _amount = TextEditingController(
        text: discount(
                Provider.of<SeatNumberModel>(context, listen: false).sumOfprice,
                points)
            .toString());
    final TextEditingController _email =
        TextEditingController(text: user?.email);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Styles.primaryColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _phoneNum,
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _amount,
                    decoration: const InputDecoration(labelText: "Amount"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 330,
            bottom: 300,
            child: GestureDetector(
              onTap: () {
                final email = _email.text;
                final phoneNum = _phoneNum.text;
                final amount = _amount.text;

                if (email.isEmpty || amount.isEmpty || phoneNum.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fields are Empty'),
                    ),
                  );
                } else {
                  // flutterwave payment
                  _makePayment(
                      context, email.trim(), phoneNum.trim(), amount.trim());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  // border: Border.all(
                  //   color: Colors.blue,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.payment),
                    Text(
                      'Make Payments',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 130,
            left: 130,
            top: 500,
            bottom: 200,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  // border: Border.all(
                  //   color: Colors.blue,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          new MaterialPageRoute(
                              builder: (context) => HomePage(
                                    location: widget.location,
                                  )),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      "DONE",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makePayment(BuildContext context, String email, String phoneNum,
      String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        publicKey: 'FLWPUBK_TEST-9a87c713ef68a600a7869a05022ef2fa-X',
        encryptionKey: 'FLWSECK_TEST6dbd3da3f9c6',
        currency: 'UGX',
        amount: amount,
        email: email,
        fullName: 'Micheal Owen',
        txRef: _ref!,
        isDebugMode: true,
        phoneNumber: phoneNum,
        acceptCardPayment: true,
        acceptUgandaPayment: true,
        acceptAccountPayment: true,
        acceptUSSDPayment: true,
      );
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response.data == null) {
        if (kDebugMode) {
          print('Transaction Failed');
        }
      } else {
        if (response.status == "Success") {
          if (kDebugMode) {
            print(response.status);
          }
          if (kDebugMode) {
            print(response.message);
          }
        } else {
          if (kDebugMode) {
            print(response.message);
          }
        }
      }
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(''),
        ),
      );
    }
  }
}

// Might cause an error
