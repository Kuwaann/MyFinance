import 'package:flutter/material.dart';
import 'login.dart';
import 'styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: AppColors.backGround,
      title: 'MyFinance',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
