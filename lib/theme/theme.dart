import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF4A90E2);
const Color backgroundColor = Colors.white;
const Color textColor = Colors.black;

final TextTheme appTextTheme = TextTheme(
  displayLarge: GoogleFonts.playfairDisplay(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: textColor,
  ),
  titleLarge: GoogleFonts.playfairDisplay(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColor,
  ),
  bodyLarge: GoogleFonts.lato(fontSize: 16, color: textColor),
  bodyMedium: GoogleFonts.lato(
    fontSize: 14,
    color: textColor.withAlpha(204),
  ), // 80% opacity
  labelLarge: GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
    surface: backgroundColor,
    onSurface: textColor,
    primary: primaryColor,
    onPrimary: Colors.white,
  ),
  textTheme: appTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: textColor),
    titleTextStyle: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      textStyle: appTextTheme.labelLarge,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Colors.grey.shade200, width: 1),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    surface: Colors.black,
    onSurface: Colors.white,
    primary: primaryColor,
    onPrimary: Colors.black,
  ),
  textTheme: appTextTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      textStyle: appTextTheme.labelLarge?.copyWith(color: Colors.black),
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.grey[900],
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Colors.grey.shade800, width: 1),
    ),
  ),
);
