import 'package:cinema_tikets/utils/constants.dart';
import 'package:flutter/material.dart';

ColorScheme lightThemeColors(context) {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFEF5B6B),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Colors.grey,
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF4D4C4C),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF4D4C4C),
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
      primaryColor: const Color(0xFFEF5B6B),
      disabledColor: Color.fromARGB(255, 221, 218, 218),
      useMaterial3: true,
      dialogBackgroundColor: const Color(0xFFFFFFFF),
      cardColor: const Color(0xFFFFFFFF),
      fontFamily: Constants.appFont.fontFamily,
      scaffoldBackgroundColor: lightThemeColors(context).background,
      textTheme: textTheme(context),
      appBarTheme: appBarTheme(context),
      colorScheme: lightThemeColors(context),
      iconTheme: const IconThemeData(color: Color(0xFF4D4C4C)),
    );
  }

  ThemeData darkThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: lightThemeColors(context).background,
      fontFamily: Constants.appFont.fontFamily,
      textTheme: textTheme(context),
      appBarTheme: appBarTheme(context),
      colorScheme: darkThemeColors(context),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFEF5B6B)
        )
      )
    );
  }

  appBarTheme(context) {
    return AppBarTheme(
      backgroundColor: lightThemeColors(context).background,
      titleTextStyle: textTheme(context).bodyLarge,
    );
  }

  TextTheme textTheme(context) {
    return TextTheme(
      bodyLarge: Constants.appFont
          .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
      bodyMedium: Constants.appFont
          .copyWith(fontWeight: FontWeight.normal, fontSize: 15),
      bodySmall: Constants.appFont.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 10,
          color: const Color(0x2983FFFF)),
      labelLarge: Constants.appFont
          .copyWith(fontWeight: FontWeight.bold, fontSize: 17,color: Colors.white),
      labelMedium: Constants.appFont
          .copyWith(fontWeight: FontWeight.normal, fontSize: 15,color: Colors.white),
      labelSmall: Constants.appFont
          .copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: Color(0xFF4D4C4C)),
      
    );
  }
