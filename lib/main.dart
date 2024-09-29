import 'package:flutter/material.dart';

import 'jane/fonts.dart';
import 'pages/bakom_kulisserna.dart';

void main() {
  runApp(const BakomKulissernaApp());
}

class BakomKulissernaApp extends StatelessWidget {
  const BakomKulissernaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BakomKulissernaMainPage(),
      theme: ThemeData(
        fontFamily: fontFamily,
        textTheme: const TextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
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
        ),
      ),
    );
  }
}
