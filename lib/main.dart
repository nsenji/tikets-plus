import 'package:cinema_tikets/api/for_metro/metro_api.dart';
import 'package:cinema_tikets/notifiers/for_acacia/seat_number_notifier.dart';
import 'package:cinema_tikets/notifiers/for_acacia/movie_notifier.dart';
import 'package:cinema_tikets/notifiers/for_metro/seat_number_notifier-metro.dart';
import 'package:cinema_tikets/notifiers/for_metro/taken_seat_notifier_metro.dart';
import 'package:cinema_tikets/pages/app_pages/cinema_location.dart';
import 'package:cinema_tikets/notifiers/for_acacia/location.dart';
import 'package:cinema_tikets/notifiers/for_acacia/time.dart';
import 'package:cinema_tikets/notifiers/for_acacia/title_image_provider.dart';
import 'package:cinema_tikets/pages/auth_pages/auth.dart';
import 'package:cinema_tikets/pages/auth_pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'api/for_acacia/seat_methods.dart';
import 'firebase_options.dart';
import 'notifiers/for_acacia/taken_seat_notifier.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SeatNumberModel()),
      ChangeNotifierProvider(create: (context) => SeatNumberModel_metro()),
      ChangeNotifierProvider(create: ((context) => MovieNotifier())),
      ChangeNotifierProvider(create: (context) => Datetime()),
      ChangeNotifierProvider(create: (context) => Place()),
      ChangeNotifierProvider(create: (context) => MovieTitle()),
      ChangeNotifierProvider(create: (context) => MovieImage()),
      ChangeNotifierProvider(create: ((context) => TakenSeat())),
      ChangeNotifierProvider(create: ((context) => TakenSeat_metro())),
      ChangeNotifierProvider(create: ((context) => Points()))
    ],
    child: const MyApp(),
  ));
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
    TakenSeat_metro takenseatMetro =
        Provider.of<TakenSeat_metro>(context, listen: false);
    getSeat(takenSeat);
    getSeat_metro(takenseatMetro);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child:
        const MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(
            //   brightness: Brightness.dark,
            //   appBarTheme: AppBarTheme(
            //     systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
            //   )
            // ),
            home: Location()),
      
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedSplashScreen(
        splash: Column(
          children: [
            const Text(
              'Tickets +',
              style: TextStyle(fontSize: 50),
            ),
            Lottie.asset('assets/splash.json'),
          ],
        ),
        nextScreen: const Wrapper(),
        splashIconSize: 500,
        backgroundColor: const Color.fromARGB(255, 192, 167, 238),
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