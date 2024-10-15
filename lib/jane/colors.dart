import 'package:flutter/material.dart';

const Color flashColor = Color.fromRGBO(243, 88, 88, 1);
const Color smallBannerColor = Color.fromARGB(255, 70, 52, 52);
const Color smallBannerTextColor = Colors.white;
const Color colorOnPictureTexts = Color.fromARGB(255, 255, 255, 255);
const Color colorOnTextsWithColoredBackground = Colors.black;

double desktopToMobileWidth = 600;

var elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    backgroundColor: Colors.white, // Background color
    foregroundColor: Colors.black, // Text color
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
  ),
);
