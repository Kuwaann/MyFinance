import 'package:flutter/material.dart';
import 'package:myfinance/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'kalkulator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 196, 0)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PageHomepage(),
        '/kalkulator': (context) => const Calculator(),
      },
    );
  }
}
