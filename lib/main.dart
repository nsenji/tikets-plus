import 'package:cinema_tikets/api/for_metro/metro_api.dart';
import 'package:cinema_tikets/notifiers/for_acacia/seat_number_notifier.dart';
import 'package:cinema_tikets/notifiers/for_acacia/movie_notifier.dart';
import 'package:cinema_tikets/notifiers/for_metro/seat_number_notifier-metro.dart';
import 'package:cinema_tikets/notifiers/for_metro/taken_seat_notifier_metro.dart';
import 'package:cinema_tikets/pages/app_pages/cinema_location.dart';
import 'package:cinema_tikets/notifiers/for_acacia/location.dart';
import 'package:cinema_tikets/notifiers/for_acacia/time.dart';
import 'package:cinema_tikets/notifiers/for_acacia/title_image_provider.dart';
import 'package:cinema_tikets/pages/auth_pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/for_acacia/seat_methods.dart';
import 'firebase_options.dart';
import 'notifiers/for_acacia/taken_seat_notifier.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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
        home: Location());
  }

  ColorScheme lightThemeColors(context) {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFFFFFFF),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFBBBBBB),
      onSecondary: Color(0xFFEAEAEA),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color.fromARGB(255, 255, 255, 255),
    );
  }

  ColorScheme darkThemeColors(context) {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFF1F2F3),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFBBBBBB),
      onSecondary: Color(0xFFEAEAEA),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFF202020),
      onBackground: Color(0xFF505050),
      surface: Color(0xFF54B435),
      onSurface: Color(0xFF54B435),
    );
  }

  ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: lightThemeColors(context).background,
      textTheme: textTheme(context),
      appBarTheme: appBarTheme(context),
      inputDecorationTheme: inputDecorationData(context),
      colorScheme: lightThemeColors(context),
      
    );
  }

  ThemeData darkThemeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: lightThemeColors(context).background,
      textTheme: textTheme(context),
      appBarTheme: appBarTheme(context),
      inputDecorationTheme: inputDecorationData(context),
      colorScheme: darkThemeColors(context),
    );
  }

  appBarTheme(context) {
    return AppBarTheme(
      backgroundColor: lightThemeColors(context).background,
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }

  InputDecorationTheme inputDecorationData(context) {
    return InputDecorationTheme(
      filled: true,
      fillColor: lightThemeColors(context).onBackground,
      hintStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: lightThemeColors(context).onSecondary),
    );
  }

  TextTheme textTheme(context) {
    return TextTheme(
        labelLarge: TextStyle(color: lightThemeColors(context).primary));
  }
  
}


@immutable
class Constants {
  const Constants._();

  /// The main orange-red color used for theming the app.
  static const Color primaryColor = Color(0xFFf03400);

  /// The color value for red color in the app.
  static const Color redColor = Color(0xFFed0000);

  /// The color value for orange color in the app.
  static const Color orangeColor = Color(0xFFf04f00);

  /// The color value for rating stars in the app.
  static const Color starsColor = Color(0xFFf78040);

  /// The color value for dark grey skeleton containers in the app.
  static const Color darkSkeletonColor = Color(0xFF656565);

  /// The color value for light grey skeleton containers in the app.
  static const Color lightSkeletonColor = Colors.grey;

  /// The red [LinearGradient] for buttons in the app.
  static const Gradient buttonGradientRed = LinearGradient(
    colors: [primaryColor, redColor],
  );

  /// The orange [LinearGradient] for buttons in the app.
  static const Gradient buttonGradientOrange = LinearGradient(
    colors: [orangeColor, redColor],
  );

  /// The orange [LinearGradient] for disabled buttons in the app.
  static const Gradient buttonGradientGrey = LinearGradient(
    colors: [textGreyColor, scaffoldGreyColor],
  );

  /// The price for a single seat ticket
  static const double ticketPrice = 800;

  /// The white [LinearGradient] for fading movies carousel in the app.
  static const Gradient movieCarouselGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.3, 0.6, 1],
    colors: [
      Color.fromRGBO(255, 255, 255, 0.95),
      Colors.white70,
      Colors.transparent,
    ],
  );

  /// The black [LinearGradient] used to overlay movie backgrounds in the app.
  static const Gradient blackOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.5, 0.7, 1],
    colors: [
      Color.fromRGBO(0, 0, 0, 0.6),
      Color.fromRGBO(0, 0, 0, 0.45),
      Color.fromRGBO(0, 0, 0, 0.3),
      Colors.transparent,
    ],
  );

  /// The color value for dark grey buttons in the app.
  static const Color buttonGreyColor = Color(0xFF1c1c1c);

  /// The color value for dark grey scaffold in the app.
  static const Color scaffoldColor = Color(0xFF141414);

  /// The color value for light grey scaffold in the app.
  static const Color scaffoldGreyColor = Color(0xFF2b2b2b);

  /// The color value for light grey text in the app.
  static const Color textGreyColor = Color(0xFF949494);

  /// The color value for white text in the app.
  static const Color textWhite80Color = Color(0xFFf2f2f2);

  /// The color value for dark grey [CustomDialog] in the app.
  static const Color barrierColor = Colors.black87;

  /// The color value for light grey [CustomDialog] in the app.
  static const Color barrierColorLight = Color(0xBF000000);

  /// The TextStyle for Lato font in the app.
  static TextStyle latoFont = GoogleFonts.lato().copyWith(color: Colors.black);

  /// The TextStyle for Poppins font in the app.
  static TextStyle poppinsFont = GoogleFonts.poppins().copyWith(
    color: textWhite80Color,
  );

  /// The TextStyle for Roboto font in the app.
  static TextStyle robotoFont = GoogleFonts.roboto();

  /// The default [Duration] value for animations in the app.
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  /// The value for bottom padding of buttons in the app.
  /// It is measured from the bottom of the screen, that is
  /// behind the android system navigation.
  /// Used to prevent overlapping of android navigation with the button.
  static const double bottomInsets = 65;

  /// The value for a smaller bottom padding of buttons in the app.
  /// It is measured from the bottom of the screen, that is
  /// behind the android system navigation.
  /// Used to prevent overlapping of android navigation with the button.
  static const double bottomInsetsLow = 48;

  /// The max number of rows a theater can contain
  static const int maxSeatRows = 12;

  

  /// The error message for invalid credit card expiry input.
  static const invalidCreditCardExpiryError = 'Please enter a valid expiry date';

  static T? toNull<T>(Object? _) => null;
}



@immutable
class CustomTheme {
  const CustomTheme._();

  /// The main starting theme for the app.
  ///
  /// Sets the following defaults:
  /// * primaryColor: [Constants.primaryColor],
  /// * scaffoldBackgroundColor: [Constants.scaffoldColor],
  /// * fontFamily: [Constants.poppinsFont].fontFamily,
  /// * iconTheme: [Colors.white] for default icon
  /// * textButtonTheme: [TextButtonTheme] without the default padding,
  static late final mainTheme = ThemeData(
    primaryColor: Constants.primaryColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Constants.primaryColor,
      primaryVariant: Constants.primaryColor,
      secondary: Constants.primaryColor,
      secondaryVariant: Constants.primaryColor,
    ),
    scaffoldBackgroundColor: Constants.scaffoldColor,
    fontFamily: Constants.poppinsFont.fontFamily,
    textTheme: TextTheme(
      headline1: Constants.poppinsFont.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        height: 1.15,
      ),
      headline2: Constants.latoFont.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        height: 1.15,
      ),
      headline3: Constants.poppinsFont.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 26,
        height: 1.15,
      ),
      headline4: Constants.latoFont.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 26,
        height: 1.15,
      ),
      headline5: Constants.poppinsFont.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        height: 1.15,
      ),
      headline6: Constants.latoFont.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        height: 1.15,
      ),
      subtitle1: Constants.poppinsFont.copyWith(
        fontWeight: FontWeight.w200,
      ),
      subtitle2: Constants.latoFont.copyWith(
        fontWeight: FontWeight.w200,
      ),
      bodyText1: Constants.poppinsFont.copyWith(
        fontWeight: FontWeight.w400,
      ),
      bodyText2: Constants.latoFont.copyWith(
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
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