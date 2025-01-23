import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  // Explore fonts at https://fonts.google.com/ and change this appTextStyle to your desired font
  // For example GoogleFonts.roboto(),
  // GoogleFonts.lato(),
  // GoogleFonts.oswald(),
  // GoogleFonts.montserrat(),
  // GoogleFonts.openSans(),
  // GoogleFonts.poppins(),
  // GoogleFonts.raleway(),
  // GoogleFonts.notoSans(),
  // GoogleFonts.ptSans(),
  // GoogleFonts.merriweather(),
  static final TextStyle appTextStyle = GoogleFonts.poppins();

// Use this for Custom Fonts, Need to be loaded in the pubspec.yaml
  // static const TextStyle appTextStyle2 = TextStyle(
  //   fontFamily:
  //       'Poppins', // Replace with the actual font family name from your assets
  // );

  static final String? fontFamily = appTextStyle.fontFamily;

  // static const TextStyle bodyMedium = TextStyle(
  //   fontFamily: 'Poppins',
  // );

  static const TextStyle titleLarge = TextStyle(
      fontFamily: 'Poppins-ExtraBold',
      fontWeight: FontWeight.w900,
      letterSpacing: 5,
      fontSize: 50);

  static const TextStyle bannerTexts = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const TextStyle footerAndLinkHeader = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle footerBody = TextStyle(
    fontSize: 15,
  );

  // static const TextStyle linkTitle =
  //     TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static const TextStyle linkTexts = TextStyle(
    fontSize: 15,
    color: Colors.black,
    // decoration: TextDecoration.underline,
  );

  static const TextStyle buttonTexts = TextStyle(
    fontSize: 22,
    // fontWeight: FontWeight.bold,
  );

  static const TextStyle pictureBodies = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
  // static const textTheme = TextTheme(
  //   bodyMedium: bodyMedium,
  //   titleLarge: titleLarge,
  // );
}
