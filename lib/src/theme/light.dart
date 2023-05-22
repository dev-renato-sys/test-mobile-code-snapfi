import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapfi_app/helpers/hex_color.dart';

final Color primaryColor = HexColor.fromHex('#dc0a2d');

final ThemeData lightTheme = ThemeData.light(useMaterial3: false).copyWith(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
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
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodySmall: const TextStyle(fontSize: 8.0, color: Colors.black),
      bodyMedium: const TextStyle(fontSize: 12.0, color: Colors.black),
      bodyLarge: const TextStyle(fontSize: 16.0, color: Colors.black),
      headlineSmall: const TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: const TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelLarge: const TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelMedium: const TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),
      labelSmall: const TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white)),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: AppBarTheme(color: primaryColor),
);
