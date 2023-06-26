// import 'package:cinema_tikets/pages/app_pages/cinema_location.dart';
// import 'package:cinema_tikets/pages/auth_pages/wrapper.dart';
// import 'package:flutter/material.dart';
// import 'flutterfire.dart';
// import 'sign_up_screen.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   bool loading = false;
//   final TextEditingController _emailField = TextEditingController();
//   final TextEditingController _passwordField = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return 
//     // loading
//     //     ? const Loading()
//     //     :
//          Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               title: const Center(
//                 child: Text('Log In'),
//               ),
//             ),
//             body: SingleChildScrollView(
//               //alignment: Alignment.topCenter,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       'Tickets+ ',
//                       style: TextStyle(
//                         fontSize: 38.0,
//                         foreground: Paint()..shader = linearGradient,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextField(
//                       controller: _emailField,
//                       decoration: const InputDecoration(
//                         //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
//                         label: Text('Email'),
//                         //hintText: 'Email',
//                         // icon: Icon(Icons.person),
//                       ),
//                       keyboardType: TextInputType.name,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: TextField(
//                       controller: _passwordField,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         //border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
//                         label: Text('password'),
//                         // icon: Icon(Icons.lock),
//                       ),
//                       keyboardType: TextInputType.visiblePassword,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 70, bottom: 200),
//                     child: SizedBox(
//                       width: 350,
//                       height: 50,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Colors.purple, Colors.blue],
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                           ),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black,
//                               blurRadius: 5.0,
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: OutlinedButton(
//                           onPressed: () async {
//                             setState(() => loading = true);
//                             bool shouldNavigate = await logIn(
//                                 _emailField.text.trim().toString(),
//                                 _passwordField.text.trim().toString());
//                             if (shouldNavigate) {
//                               setState(() => loading = false);
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const Location(),
//                                 ),
//                               );
//                             } else {
//                               setState(() => loading = false);
//                               print('there is an error with log in details');
//                             }
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                               Colors.transparent,
//                             ),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           ),
//                           child: const Text(
//                             'LOG IN',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Padding(
//                     //   padding: EdgeInsets.only(top: 100,bottom: 10),
//                     //   child: Divider(
//                     //   thickness: 2,
//                     //     indent: 10,
//                     //     endIndent: 10,
//                     //     color: Colors.grey,
//                     //   ),
//                     // ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Text(
//                         'Does not have account?',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                       TextButton(
//                           child: const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                                 fontSize: 19,
//                                 decoration: TextDecoration.underline,
//                                 color: Colors.blue),
//                           ),
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: ((context) => const SignUpScreen()))))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }
