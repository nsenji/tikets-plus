import 'package:cinema_tikets/notifiers/for_acacia/seat_number_notifier.dart';
import 'package:cinema_tikets/notifiers/for_acacia/movie_notifier.dart';
import 'package:cinema_tikets/notifiers/for_metro/seat_number_notifier-metro.dart';
import 'package:cinema_tikets/notifiers/for_metro/taken_seat_notifier_metro.dart';
import 'package:cinema_tikets/pages/app_pages/home.dart';
import 'package:cinema_tikets/notifiers/for_acacia/location.dart';
import 'package:cinema_tikets/notifiers/for_acacia/time.dart';
import 'package:cinema_tikets/notifiers/for_acacia/title_image_provider.dart';
import 'package:cinema_tikets/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifiers/for_acacia/taken_seat_notifier.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
    // getSeat(takenSeat);
    // getSeat_metro(takenseatMetro);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightThemeData(context),
        // theme: FlexThemeData.light(scheme:FlexScheme.mandyRed,useMaterial3: true),
        //darkTheme:FlexThemeData.dark(scheme: FlexScheme.mandyRed) ,
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const Home());
  }

  
}




