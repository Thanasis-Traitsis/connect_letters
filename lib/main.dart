import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'presentation/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Manrope',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: textColor,
          foregroundColor: whiteColor,
        )
      ),
    );
  }
}
