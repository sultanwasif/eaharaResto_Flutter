import 'package:flutter/material.dart';
import 'package:flutterapp/src/constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: tDarkColor, fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.montserrat(color:  tDarkColor, fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.montserrat(color: tDarkColor, fontWeight: FontWeight.bold, fontSize: 30),
    headlineSmall: GoogleFonts.poppins(color: tDarkColor, fontWeight: FontWeight.w700),
    titleLarge: GoogleFonts.poppins(color: tDarkColor),
    titleMedium: GoogleFonts.poppins(color: tDarkColor),
    titleSmall: GoogleFonts.poppins(color: tDarkColor),
    bodyLarge: GoogleFonts.poppins(color: tDarkColor),
    bodyMedium: GoogleFonts.poppins(color: tDarkColor),
    bodySmall: GoogleFonts.poppins(color: tDarkColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: tWhiteColor),
    titleSmall: GoogleFonts.poppins(color: tWhiteColor, fontSize: 24),
    headlineSmall: GoogleFonts.montserrat(color: tWhiteColor),
    headlineLarge: GoogleFonts.montserrat(color: tWhiteColor),
    headlineMedium: GoogleFonts.montserrat(color: tWhiteColor),
    titleLarge: GoogleFonts.poppins(color: tWhiteColor),
    titleMedium: GoogleFonts.poppins(color: tWhiteColor),
  );
}