import 'package:cinema_tikets/notifiers/seat_number_notifier.dart';
import 'package:cinema_tikets/notifiers/movie_notifier.dart';
import 'package:cinema_tikets/pages/app_pages/cinema_location.dart';
import 'package:cinema_tikets/pages/app_pages/home_page.dart';
import 'package:cinema_tikets/pages/auth_pages/auth.dart';
import 'package:cinema_tikets/pages/auth_pages/wrapper.dart';
import 'package:cinema_tikets/pages/bottom_navigation_bar/main_page.dart';
import 'package:cinema_tikets/pages/bottom_navigation_bar/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'api/movie_api.dart';
import 'firebase_options.dart';
import 'notifiers/taken_seat_notifier.dart';


void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SeatNumberModel()),
         ChangeNotifierProvider(create: ((context) => MovieNotifier())),
         ChangeNotifierProvider(create: ((context) => TakenSeat())
        )],
      child:  const MyApp(),
  )
    );
    
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    TakenSeat takenSeat = Provider.of<TakenSeat>(context, listen: false);
    getSeat(takenSeat);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Location()
      ),
    );
  }
}
 































//  class MyApp extends StatelessWidget {
//   const MyApp({super.key});

  

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
        
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MainPage(),
//     );
//   }
// }