import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
        primary: ungucerah,
        onPrimary: ungu,
        secondary: grey,
        onSecondary: biru,
        tertiary: hijau,
        onTertiary: grey,
        tertiaryContainer: white),
  );
}

// => COLOR
Color ungucerah = Color.fromRGBO(115, 103, 240, 1);
Color ungu = Color.fromRGBO(187, 107, 217, 0.2);
Color ungudark = Color.fromRGBO(187, 107, 217, 1);
Color biru = Color.fromRGBO(47, 128, 237, 0.2);
Color birudark = Color.fromRGBO(47, 128, 237, 1);
Color hijau = Color.fromRGBO(33, 150, 83, 0.2);
Color hijaudark = Color.fromRGBO(33, 150, 83, 1);
Color grey = Color.fromRGBO(75, 75, 75, 0.12);
Color greydark = Color.fromRGBO(51, 51, 51, 1);
Color white = Color.fromRGBO(255, 255, 255, 1);
Color greymedium = Color.fromRGBO(201, 194, 194, 1);
Color grey2 = Color.fromRGBO(75, 75, 75, 1);

// => FONT WEIGHT
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

// FONTSTYLE
TextStyle titleTextStyle =
    GoogleFonts.montserrat(color: white, fontSize: 30, fontWeight: bold);
TextStyle subtitleTextStyle =
    GoogleFonts.montserrat(color: grey, fontSize: 16, fontWeight: bold);
TextStyle singleTextStyle =
    GoogleFonts.montserrat(color: ungucerah, fontSize: 16, fontWeight: bold);
TextStyle floatingButtonTextStyle =
    GoogleFonts.inter(fontSize: 16, fontWeight: bold);

// => PADDING
const defaultPadding = 20.0;
