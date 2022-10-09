// import 'dart:io';
// import 'dart:math';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterwave/flutterwave.dart';
// import 'package:flutterwave/models/responses/charge_response.dart';

// import '../utils/styles.dart';

// class Payments extends StatefulWidget {
//   const Payments({Key? key}) : super(key: key);

//   @override
//   State<Payments> createState() => _PaymentsState();
// }

// class _PaymentsState extends State<Payments> {
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _phoneNum = TextEditingController();
//   final TextEditingController _amount = TextEditingController();

//   String? _ref;

//   void setRef() {
//     Random rand = Random();
//     int number = rand.nextInt(2000);

//     if (!kIsWeb && Platform.isAndroid) {
//       //especially on these setState parts
//       setState(() {
//         _ref = 'AndroidRef1789$number';
//       });
//     } else {
//       setState(() {
//         _ref = 'IOSRef1789$number';
//       });
//     }
//   }

//   @override
//   void initState() {
//     setRef();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Payment"),
//         backgroundColor: Styles.primaryColor,
//         centerTitle: true,

//       ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 10),
//                     child: TextFormField(
//                       controller: _email,
//                       decoration: const InputDecoration(labelText: "Email"),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 10),
//                     child: TextFormField(
//                       controller: _phoneNum,
//                       decoration: const InputDecoration(labelText: "Phone Number"),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 10),
//                     child: TextFormField(
//                       controller: _amount,
//                       decoration: const InputDecoration(labelText: "Amount"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               child: GestureDetector(
//                 onTap: () {
//                   final email = _email.text;
//                   final phoneNum = _phoneNum.text;
//                   final amount = _amount.text;

//                   if (email.isEmpty || amount.isEmpty || phoneNum.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Fields are Empty'),
//                       ),
//                     );
//                   } else {
//                     //flutterwave payment
//                     _makePayment(context, email.trim(), phoneNum.trim(),amount.trim());
//                   }
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.red,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: const [
//                       Icon(Icons.payment),
//                       Text(
//                         'Make Payments',
//                         style:
//                             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _makePayment(
//       BuildContext context, String email, String phoneNum, String amount) async {
//     try {
//       Flutterwave flutterwave = Flutterwave.forUIPayment(
//         context: this.context,
//         publicKey: 'FLWPUBK_TEST-9a87c713ef68a600a7869a05022ef2fa-X',
//         encryptionKey: 'FLWSECK_TEST6dbd3da3f9c6',
//         currency: 'UGX',
//         amount: amount,
//         email: email,
//         fullName: 'Micheal Owen',
//         txRef: _ref!,
//         isDebugMode: true,
//         phoneNumber: phoneNum,
//         acceptCardPayment: true,
//         acceptUgandaPayment: true,
//         acceptAccountPayment: true,
//         acceptUSSDPayment: true,
//       );
//       final ChargeResponse response =
//           await flutterwave.initializeForUiPayments();
//       if (response.data == null) {
//         if (kDebugMode) {
//           print('Transaction Failed');
//         }
//       } else {
//         if (response.status == "Success") {
//           if (kDebugMode) {
//             print(response.status);
//           }
//           if (kDebugMode) {
//             print(response.message);
//           }
//         } else {
//           if (kDebugMode) {
//             print(response.message);
//           }
//         }
//       }
//     } catch (error) {
//       print(error);
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text(''),
//       //   ),
//       // );
//     }
//   }
// }

// //Might cause an error
