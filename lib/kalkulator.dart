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
                Expanded(
                  child: Row(
                    children: [
                      buildButton("AC"),
                      buildButton("÷"),
                      buildButton("×"),
                      buildButton("%"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("+"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("-"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("⌫"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("0", flex: 2),
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
              handleButtons(text);
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
    if (text == '=') return Colors.white;
    if (['0','1','2','3','4','5','6','7','8','9'].contains(text)) {
      return const Color.fromARGB(255, 63, 63, 63);
    }
    return Colors.grey[850]!;
  }

  /// Warna teks tombol
  Color getColor(String text) {
    if (text == '=') return Colors.black;
    return Colors.white;
  }

  /// Logika tombol
  void handleButtons(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    }
    if (text == "⌫") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
      return;
    }
    if (text == "=") {
      result = calculate();
      return;
    }

    userInput += text;
  }

  /// Fungsi hitung sederhana tanpa package
  String calculate() {
    try {
      String input = userInput;
      // ganti simbol agar lebih mudah
      input = input.replaceAll("×", "*").replaceAll("÷", "/");

      // parsing manual
      List<String> tokens = tokenize(input);
      double eval = evaluate(tokens);
      return eval.toString();
    } catch (e) {
      return "Error";
    }
  }

  /// Pisahkan angka dan operator
  List<String> tokenize(String input) {
    List<String> tokens = [];
    String number = "";

    for (int i = 0; i < input.length; i++) {
      String ch = input[i];

      if ("0123456789.".contains(ch)) {
        number += ch;
      } else {
        if (number.isNotEmpty) {
          tokens.add(number);
          number = "";
        }
        tokens.add(ch);
      }
    }

    if (number.isNotEmpty) tokens.add(number);
    return tokens;
  }

  /// Evaluasi dengan prioritas operator
  double evaluate(List<String> tokens) {
    // tahap 1: × dan ÷
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == "*" || tokens[i] == "/") {
        double left = double.parse(tokens[i - 1]);
        double right = double.parse(tokens[i + 1]);
        double res = tokens[i] == "*" ? left * right : left / right;

        tokens.replaceRange(i - 1, i + 2, [res.toString()]);
        i -= 1;
      }
    }

    // tahap 2: + dan -
    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double num = double.parse(tokens[i + 1]);

      if (op == "+") result += num;
      if (op == "-") result -= num;
    }

    return result;
  }
}
