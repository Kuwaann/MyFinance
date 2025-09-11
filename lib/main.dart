import 'package:flutter/material.dart';
import 'package:myfinance/gg.dart';
import 'package:myfinance/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfinance/login.dart';
import 'package:myfinance/kalkulator.dart';
import 'package:myfinance/kelompok.dart';

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
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/homepage': (context) => const PageHomepage(),
        '/kalkulator': (context) => const Calculator(),
        '/ganjilgenap': (context) => const OddEvenPage(),
        '/team': (context) => const TeamPage(),
      },
    );
  }
}
