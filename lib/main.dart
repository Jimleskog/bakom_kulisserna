import 'package:flutter/material.dart';

import 'jane/colors.dart';
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
        elevatedButtonTheme: elevatedButtonThemeData,
      ),
    );
  }
}
