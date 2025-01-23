import 'package:flutter/material.dart';

import 'fonts.dart';

const Color flashColor = Color.fromRGBO(254, 77, 61, 1);
const Color smallBannerColor = Color.fromARGB(255, 255, 255, 255);
const Color smallBannerTextColor = Colors.black;
const Color colorOnPictureTexts = Color.fromARGB(255, 255, 255, 255);
const Color colorOnTextsWithColoredBackground = Colors.white;

double desktopToMobileWidth = 600;

const double spaceBetweenRows = 38;

const double picturePadding = 14;

var elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.fromLTRB(56, 28, 56, 28),

    backgroundColor: Colors.white, // Background color
    foregroundColor: Colors.black, // Text color
    textStyle: AppFont.buttonTexts,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
  ),
);
