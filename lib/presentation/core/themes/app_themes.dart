import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Color lightPrimaryColor = Colors.white;
  static const Color lightOnPrimaryColor = Color(0xFF004182);
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightPrimaryColor,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: lightOnPrimaryColor,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: lightPrimaryColor)
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    textTheme: TextTheme(
      labelSmall: GoogleFonts.poppins(
          color: lightPrimaryColor, fontWeight: FontWeight.w300),
      labelMedium: GoogleFonts.poppins(
          color: lightPrimaryColor, fontWeight: FontWeight.w500),
      labelLarge: GoogleFonts.poppins(
          color: lightPrimaryColor, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        prefixIconColor: lightOnPrimaryColor,
        errorMaxLines: 5,
        errorStyle: GoogleFonts.poppins(
            color: Colors.redAccent, fontWeight: FontWeight.w300),
        hintStyle: GoogleFonts.poppins(
            color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lightOnPrimaryColor),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lightOnPrimaryColor),
            borderRadius: BorderRadius.circular(25)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
            borderRadius: BorderRadius.circular(15))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        backgroundColor: lightOnPrimaryColor,
        elevation: 0,
        selectedItemColor: lightOnPrimaryColor,
        unselectedItemColor: lightPrimaryColor),
  );
}
