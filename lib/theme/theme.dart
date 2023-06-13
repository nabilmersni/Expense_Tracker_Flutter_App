import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

const kLightColorScheme = {
  'primary': Color(0xff7262AF),
  'lighPrimary': Color.fromARGB(255, 243, 240, 255),
  'darkPrimary': Color(0xff3A3D64),
  'darkPrimary2': Color.fromARGB(255, 3, 14, 40),
  'secondary': Color(0xffF3ECB0),
};

var kLightTheme = ThemeData().copyWith(
  useMaterial3: true,
  appBarTheme: const AppBarTheme().copyWith(
    centerTitle: true,
    actionsIconTheme: const IconThemeData().copyWith(
      color: kLightColorScheme['primary'],
    ),
    backgroundColor: kLightColorScheme['lighPrimary'],
    titleTextStyle: GoogleFonts.nunito(
      color: kLightColorScheme['primary'],
      fontSize: 22,
    ),
  ),
  scaffoldBackgroundColor: kLightColorScheme['lighPrimary'],
  cardTheme: const CardTheme().copyWith(
    color: kLightColorScheme['primary'],
  ),
  textTheme: const TextTheme().copyWith(
    titleMedium: GoogleFonts.nunito(
      color: kLightColorScheme['lighPrimary'],
      fontSize: 19,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.nunito(
      color: kLightColorScheme['lighPrimary'],
      fontSize: 15,
    ),
  ),
);
