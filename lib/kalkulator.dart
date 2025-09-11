import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A11),
      body: Column(
        children: [
          // Bagian atas / display input dan hasil
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white, height: 1),

          // Bagian bawah / tombol untuk input
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // Baris 1
                Expanded(
                  child: Row(
                    children: [
                      buildButton("AC"),
                      buildButton("("),
                      buildButton(")"),
                      buildButton("%"),
                    ],
                  ),
                ),
                // Baris 2
                Expanded(
                  child: Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("×"),
                    ],
                  ),
                ),
                // Baris 3
                Expanded(
                  child: Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+"),
                    ],
                  ),
                ),
                // Baris 4
                Expanded(
                  child: Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                ),
                // Baris 5
                Expanded(
                  child: Row(
                    children: [
                      buildButton("⌫"),
                      buildButton("0"),
                      buildButton("."),
                      buildButton("="),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Custom bentuk tombol
  Widget buildButton(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: InkWell(
          onTap: () {
            setState(() {
              userInput += text;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: getBgColor(text),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: getColor(text),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Warna background tombol
  Color getBgColor(String text) {
    if (text == '=') return const Color.fromARGB(255, 255, 255, 255);
    if (['1', '2', '3', '4', '5', '6', '7', '8', '9'].contains(text)) {
      return const Color.fromARGB(255, 63, 63, 63);
    }
    return Colors.grey[850]!;
  }

  /// Warna teks tombol
  Color getColor(String text) {
    if (text == '=') return const Color.fromARGB(255, 0, 0, 0);
    return Colors.white;
  }
}
