import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
    // textTheme: GoogleFonts.sansitaTextTheme(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // This is a custom color variable
        // textStyle: GoogleFonts.fredokaOne(),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: Colors.black54,

    // primaryColorLight: HexColor.fromHex('#62bfd2'),
    appBarTheme: const AppBarTheme(color: Colors.black));
