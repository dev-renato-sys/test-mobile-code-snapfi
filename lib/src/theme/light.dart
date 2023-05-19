import 'package:flutter/material.dart';
import 'package:snapfi_app/helpers/hex_color.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quali_app/helpers/hex_color.dart';

final Color primaryColor = HexColor.fromHex('#dc0a2d');

final ThemeData lightTheme = ThemeData.light(useMaterial3: false).copyWith(
  // textTheme: GoogleFonts.dmSansTextTheme(),
  // colorScheme: ColorScheme.light(primaryContainer: HexColor.fromHex('#e0b53d')),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, // This is a custom color variable
      // textStyle: GoogleFonts.fredokaOne(),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
    prefixIconColor: Colors.grey[400],
    suffixIconColor: Colors.grey[400],
    border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(70.0))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(70.0))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: HexColor.fromHex('#e8edf2')),
        borderRadius: const BorderRadius.all(Radius.circular(70.0))),
  ),
  textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 8.0, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 12.0, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
      headlineSmall: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelLarge: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelMedium: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelSmall: TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white)),
  // .apply(bodyColor: Colors.black, displayColor: Colors.black),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
  // primaryColor: HexColor.fromHex('#3399b5'),
  // primaryColorDark: HexColor.fromHex('#e0b53d'),
  // primaryColorLight: HexColor.fromHex('#e0b53d'),
  appBarTheme: AppBarTheme(color: primaryColor),
);
