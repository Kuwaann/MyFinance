import 'package:flutter/material.dart';

class AppColors {
  static const backGround = Color.fromARGB(255, 10, 10, 17);
  static const outlineElement = Color.fromARGB(255, 37, 37, 58);
  static const element = Color.fromARGB(255, 19, 19, 26);
  static const button = Color.fromARGB(255, 163, 189, 13);
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Colors.purpleAccent, Colors.blueAccent],
    begin: Alignment.centerLeft, // Opsional: titik mulai gradien
    end: Alignment.centerRight,   // Opsional: titik akhir gradien
  );

  static const backgroundLogin = Color.fromARGB(255, 10, 10, 17);
  static const backgroundLayout = Color.fromARGB(255, 17, 17, 29);
}
